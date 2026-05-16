//
//  MetalRenderLoopController.swift
//  MetalKitPlus
//
//  Created by Jude Edwards on 16/5/2026.
//

import MetalKit

struct MetalRenderLoopController {
    let device: MTLDevice
    let renderEncoder: MTLRenderCommandEncoder
}

extension MetalRenderLoopController {
    func drawVertices(_ vertices: [Vertex]) {
        guard let vertexBuffer = device.makeBuffer(bytes: vertices,
                                                   length: MemoryLayout<Vertex>.stride * vertices.count,
                                                   options: []) else {
            fatalError("Failed to create Vertex Buffer")
        }
        renderEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
    }
    func drawShape(_ shape: MetalShape) {
        drawVertices(shape.vertecies)
    }
}
