// The Swift Programming Language
// https://docs.swift.org/swift-book

import MetalKit

extension MetalViewPlus {
    public init (device: MTLDevice, renderLoop: @escaping (MetalRenderLoopController) -> Void) {
        self.init(device: device, renderLoop: renderLoop)
    }
}
