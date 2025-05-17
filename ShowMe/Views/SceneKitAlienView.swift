//
//  SceneKitAlienView.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/16/25.
//

// Views/SceneKitAlienView.swift

import SwiftUI
import SceneKit

struct SceneKitAlienView: UIViewRepresentable {
    @Binding var pose: Pose
    @Binding var scale: CGFloat
    @Binding var offset: CGSize

    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.backgroundColor = .clear

        let alienNode = SCNScene(named: "Alien.usdz")?.rootNode.clone() ?? SCNNode()
        alienNode.name = "alien"
        alienNode.scale = SCNVector3(0.5, 0.5, 0.5)
        alienNode.position = SCNVector3(0, 0, 0)

        scene.rootNode.addChildNode(alienNode)
        sceneView.allowsCameraControl = false
        return sceneView
    }

    func updateUIView(_ scnView: SCNView, context: Context) {
        if let alien = scnView.scene?.rootNode.childNode(withName: "alien", recursively: true) {
            // Change color based on pose (placeholder for real animations)
            alien.geometry?.firstMaterial?.diffuse.contents = pose.color

            alien.position = SCNVector3(offset.width / 100, -offset.height / 100, 0)
            alien.scale = SCNVector3(scale, scale, scale)
        }
    }
}
