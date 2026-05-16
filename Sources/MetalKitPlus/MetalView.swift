//
//  MetalView.swift
//  MetalKitPlus
//
//  Created by Jude Edwards on 15/5/2026.
//

import SwiftUI
import MetalKit

struct MetalView: UIViewRepresentable {
    
    typealias UpdateHandler = (_ view: MTKView, _ size: CGSize) -> Void
    
    var draw: (_ view: MTKView) -> Void
    var handleUpdate: UpdateHandler?
    
    func makeCoordinator() -> MetalViewCoordinator {
        MetalViewCoordinator(self)
    }
    
    func makeUIView(context: Context) -> MTKView {
        let view = MTKView()
        
        view.delegate = context.coordinator
        view.device = context.environment.metalDevice
        view.drawableSize = view.frame.size
        
        view.clearColor = context.environment.metalConfig.clearColor
        view.colorPixelFormat = context.environment.metalConfig.colorPixelFormat
        view.depthStencilPixelFormat = context.environment.metalConfig.depthStencilPixelFormat
        
        view.preferredFramesPerSecond = context.environment.metalConfig.preferredFramesPerSecond
        view.enableSetNeedsDisplay = context.environment.metalConfig.enableSetNeedsDisplay
        view.framebufferOnly = context.environment.metalConfig.framebufferOnly
        print("Made MTKView")
        return view
    }
    func updateUIView(_ view: MTKView, context: Context) {
        print("Updated MTKView")
    }
}

class MetalViewCoordinator: NSObject, MTKViewDelegate {
    
    var parent: MetalView
    
    init(_ parent: MetalView) {
        self.parent = parent
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        if let handleUpdate = parent.handleUpdate {
            handleUpdate(view, size)
        }
    }
    
    func draw(in view: MTKView) {
        parent.draw(view)
    }
}
