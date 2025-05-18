//
//  AlienCreationView.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/17/25.
//

import SwiftUI

struct AlienCreationView: View {
    @State private var alienName: String = ""
    var onComplete: (String) -> Void

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                AlienPreviewView()
                    .frame(height: 300)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Who are you showing the world to?")
                        .font(.headline)

                    TextField("Enter alien name", text: $alienName)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                }

                Group {
                    CustomizationRow(title: "Body")
                    CustomizationRow(title: "Eyes")
                    CustomizationRow(title: "Ears")
                    CustomizationRow(title: "Top")
                    CustomizationRow(title: "Arms")
                    CustomizationRow(title: "Legs")
                    CustomizationRow(title: "Tail")
                    CustomizationRow(title: "Color")
                }

                Button(action: {
                    onComplete(alienName)
                }) {
                    Text("Save Alien")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
        }
    }
}

