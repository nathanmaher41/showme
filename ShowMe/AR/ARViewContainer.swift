//
//  ARViewContainer.swift
//  ShowMe
//
//  Created by Nathan Maher on 4/30/25.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    static var arView: ARView!

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        ARViewContainer.arView = arView

        // Set up AR session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)

        // Add anchor and load model
        let anchor = AnchorEntity(plane: .horizontal)

        if let alienEntity = try? ModelEntity.loadModel(named: "Alien") {
            alienEntity.generateCollisionShapes(recursive: true)
            alienEntity.setScale(SIMD3<Float>(0.5, 0.5, 0.5), relativeTo: nil)
            anchor.addChild(alienEntity)
        }

        arView.scene.anchors.append(anchor)

        // Listen for screenshot event
        NotificationCenter.default.addObserver(forName: Notification.Name("takeScreenshot"), object: nil, queue: .main) { _ in
          arView.snapshot(saveToHDR: false) { image in
              guard let image = image else {
                  print("❌ Failed to capture screenshot.")
                  return
              }

              UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
              print("📸 Screenshot saved to Photos.")
          }
        }

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}
