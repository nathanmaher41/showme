//
//  AlienStudio.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/16/25.
//

// Views/AlienStudioView.swift

import SwiftUI

struct AlienStudioView: View {
    let photo: UIImage

    @State private var pose: Pose = .idle
    @State private var scale: CGFloat = 0.5
    @GestureState private var dragOffset = CGSize.zero
    @State private var finalOffset = CGSize.zero
    
    
    var body: some View {
        ZStack {
            Image(uiImage: photo)
                .resizable()
                .scaledToFit()

            SceneKitAlienView(
                pose: $pose,
                scale: $scale,
                offset: .constant(finalOffset + dragOffset)
            )
            .frame(width: 300, height: 300)
            .gesture(dragGesture)
            .gesture(pinchGesture)
        }
        .overlay(posePicker, alignment: .bottom)
        .edgesIgnoringSafeArea(.all)
    }

    var dragGesture: some Gesture {
        DragGesture()
            .updating($dragOffset) { value, state, _ in
                state = value.translation
            }
            .onEnded { value in
                finalOffset.width += value.translation.width
                finalOffset.height += value.translation.height
            }
    }

    var pinchGesture: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                scale = value
            }
    }

    var posePicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Pose.allCases) { poseOption in
                    Button(action: {
                        pose = poseOption
                    }) {
                        Text(poseOption.rawValue.capitalized)
                            .padding()
                            .background(pose == poseOption ? Color.blue : Color.gray)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding()
        }
    }
}
