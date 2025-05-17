//
//  ARAlienView.swift
//  ShowMe
//
//  Created by Nathan Maher on 4/30/25.
//

import SwiftUI
import RealityKit
import ARKit

struct ARAlienView: View {
    var body: some View {
        ZStack {
            ARViewContainer().edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                Button(action: takeScreenshot) {
                    Image(systemName: "camera.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                }
                .padding(.bottom, 40)
            }
        }
    }

    func takeScreenshot() {
        // Will hook this up after ARView setup
        NotificationCenter.default.post(name: Notification.Name("takeScreenshot"), object: nil)
    }
}
