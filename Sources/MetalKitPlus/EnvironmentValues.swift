//
//  MetalConfig.swift
//  MetalKitPlus
//
//  Created by Jude Edwards on 15/5/2026.
//

import Foundation
import SwiftUI
import MetalKit

public extension EnvironmentValues {
    @Entry var metalConfig = MetalConfig()
    @Entry var metalDevice = MTLCreateSystemDefaultDevice()
    @Entry var metalState = MetalState()
}

public struct MetalConfig {
    public var clearColor: MTLClearColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
    
    public var colorPixelFormat: MTLPixelFormat = .bgra8Unorm
    public var depthStencilPixelFormat: MTLPixelFormat = .depth32Float
    
    public var preferredFramesPerSecond: Int = 60
    public var enableSetNeedsDisplay: Bool = true
    public var framebufferOnly: Bool = false
    
    public var isDepthWriteEnabled: Bool = true
    public var depthCompareFunction: MTLCompareFunction = .less
}

public struct MetalState {
    var commandQueue: MTLCommandQueue?
    var library: MTLLibrary?
    var renderPipelineState: MTLRenderPipelineState?
    var depthStencilState: MTLDepthStencilState?
    
    public init(
        commandQueue: MTLCommandQueue? = nil,
        library: MTLLibrary? = nil,
        renderPipelineState: MTLRenderPipelineState? = nil,
        depthStencilState: MTLDepthStencilState? = nil
    ) {
        self.commandQueue = commandQueue
        self.library = library
        self.renderPipelineState = renderPipelineState
        self.depthStencilState = depthStencilState
    }
}
