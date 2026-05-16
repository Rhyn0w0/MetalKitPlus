//
//  MetalViewPlus.swift
//  MetalKitPlus
//
//  Created by Jude Edwards on 16/5/2026.
//

import SwiftUI
import MetalKit

public struct MetalViewPlus: View {
    
    @Environment(\.metalDevice) var device
    @Environment(\.metalCommandQueue) var commandQueue
    @Environment(\.metalLibrary) var metalLibrary
    @Environment(\.metalRenderPipelineState) var renderPipelineState
    @Environment(\.metalDepthStencilState) var depthStencilState
    
    var runRenderLoop: (_ controller: MetalRenderLoopController) -> Void
    
    public init(renderLoop: @escaping (_ controller: MetalRenderLoopController) -> Void) {
        self.runRenderLoop = renderLoop
    }
    
    public var body: some View {
        if let device = device {
            MetalView(draw: draw)
        }
        else {
            Text("Unable to access GPU")
        }
    }
    
    func draw(view: MTKView) {
        guard let device = device else { return }
        guard let drawable = view.currentDrawable else { return }
        guard let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
        
        guard let commandBuffer = commandQueue?.makeCommandBuffer() else {
            fatalError("failed to set up render encoding, no command buffer")
        }
        guard let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor) else {
            fatalError("failed to set up render encoding, no render encoder")
        }
        
        if let renderPipelineState = renderPipelineState {
            renderEncoder.setRenderPipelineState(renderPipelineState)
        }
        if let depthStencilState = depthStencilState {
            renderEncoder.setDepthStencilState(depthStencilState)
        }
        
        let renderLoopController = MetalRenderLoopController(
            device: device,
            encoder: renderEncoder
        )
        runRenderLoop(renderLoopController)
        
        renderEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
        print("rendered")
    }
}
