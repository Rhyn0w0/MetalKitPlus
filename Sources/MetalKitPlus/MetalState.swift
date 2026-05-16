//
//  MetalState.swift
//  MetalKitPlus
//
//  Created by Jude Edwards on 15/5/2026.
//

import Foundation
import SwiftUI



//extension MetalState {
//    func makeDevice() {
//        if let device = MTLCreateSystemDefaultDevice() {
//            self.device = device
//        }
//        else {
//            print("failed to create device")
//        }
//    }
//    func makeCommandQueue() {
//        if let commandQueue = device?.makeCommandQueue() {
//            self.commandQueue = commandQueue
//        }
//        else {
//            print("failed to create command queue")
//        }
//    }
//    func makeLibrary() {
//        if let library = device?.makeDefaultLibrary() {
//            self.library = library
//        }
//        else {
//            print("failed to create library")
//        }
//    }
//    func makeRenderPipelineState(with descriptor: MTLRenderPipelineDescriptor) {
//        do {
//            renderPipelineState = try device?.makeRenderPipelineState(descriptor: descriptor)
//        }
//        catch {
//            print(error)
//        }
//    }
//    func makeDepthStencilState(with descriptor: MTLDepthStencilDescriptor) {
//        depthStencilState = device?.makeDepthStencilState(descriptor: descriptor)
//    }
//}

