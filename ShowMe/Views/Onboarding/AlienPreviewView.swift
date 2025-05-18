//
//  AlienPreviewView.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/17/25.
//

import SwiftUI
import SceneKit

struct AlienPreviewView: UIViewRepresentable {
    @State static var rotation: Float = 0

    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        let scene = SCNScene()

        let alienNode = SCNScene(named: "Alien.usdz")?.rootNode.clone() ?? SCNNode()
        alienNode.name = "alien"
        alienNode.position = SCNVector3(0, -0.2, 0)
        alienNode.scale = SCNVector3(0.01, 0.01, 0.01)

        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 3.5)
        scene.rootNode.addChildNode(cameraNode)

        scene.rootNode.addChildNode(alienNode)

        sceneView.scene = scene
        sceneView.allowsCameraControl = false
        sceneView.backgroundColor = UIColor.clear
        sceneView.autoenablesDefaultLighting = true

        // Add pan gesture recognizer
        let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan(_:)))
        sceneView.addGestureRecognizer(panGesture)

        context.coordinator.alienNode = alienNode
        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject {
        var alienNode: SCNNode?

        @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
            let translation = gesture.translation(in: gesture.view)
            let rotationAmount = Float(translation.x) * 0.01
            alienNode?.eulerAngles.y = rotationAmount
        }
    }
}
