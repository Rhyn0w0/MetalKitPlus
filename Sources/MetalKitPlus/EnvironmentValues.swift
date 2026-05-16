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
    @Entry var metalCommandQueue: MTLCommandQueue?
    @Entry var metalLibrary: MTLLibrary?
    @Entry var metalRenderPipelineState: MTLRenderPipelineState?
    @Entry var metalDepthStencilState: MTLDepthStencilState?
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
