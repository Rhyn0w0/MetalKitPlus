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
    var clearColor: MTLClearColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
    
    var colorPixelFormat: MTLPixelFormat = .bgra8Unorm
    var depthStencilPixelFormat: MTLPixelFormat = .depth32Float
    
    var preferredFramesPerSecond: Int = 60
    var enableSetNeedsDisplay: Bool = true
    var framebufferOnly: Bool = false
    
    var isDepthWriteEnabled: Bool = true
    var depthCompareFunction: MTLCompareFunction = .less
}

public struct MetalState {
    var device: MTLDevice?
    var commandQueue: MTLCommandQueue?
    var library: MTLLibrary?
    var renderPipelineState: MTLRenderPipelineState?
    var depthStencilState: MTLDepthStencilState?
}
