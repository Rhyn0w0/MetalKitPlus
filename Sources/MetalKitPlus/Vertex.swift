//
//  Vertex.swift
//  MetalKitPlus
//
//  Created by Jude Edwards on 15/5/2026.
//

import MetalKit

public struct Vertex {
    let position: SIMD3<Float>
    let colorRgb: SIMD3<Float>
    
    public init(position: SIMD3<Float>, colorRgb: SIMD3<Float>) {
        self.position = position
        self.colorRgb = colorRgb
    }
    
    public static func buildDefaultVertexDescriptor() -> MTLVertexDescriptor {
        let vertexDescriptor = MTLVertexDescriptor()
        
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0
        
        vertexDescriptor.attributes[1].format = .float3
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = MemoryLayout<Vertex>.offset(of: \.colorRgb)!
        
        vertexDescriptor.layouts[0].stride = MemoryLayout<Vertex>.stride
        
        return vertexDescriptor
    }
}
