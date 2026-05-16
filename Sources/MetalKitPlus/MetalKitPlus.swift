// The Swift Programming Language
// https://docs.swift.org/swift-book

import MetalKit

extension MetalViewPlus {
    public init (renderLoop: @escaping (MetalRenderLoopController) -> Void) {
        self.runRenderLoop = renderLoop
    }
}
