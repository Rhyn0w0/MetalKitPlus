//
//  MetalRenderLoopController.swift
//  MetalKitPlus
//
//  Created by Jude Edwards on 16/5/2026.
//

import MetalKit

public struct MetalRenderLoopController {
    let device: MTLDevice
    let encoder: MTLRenderCommandEncoder
    
    public func drawVertices(_ vertices: [Vertex]) {
        guard let vertexBuffer = device.makeBuffer(bytes: vertices,
                                                   length: MemoryLayout<Vertex>.stride * vertices.count,
                                                   options: []) else {
            fatalError("Failed to create Vertex Buffer")
        }
        encoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        encoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
    }
    public func drawShape(_ shape: MetalShape) {
        drawVertices(shape.vertecies)
    }
}
