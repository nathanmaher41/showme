//
//  HomeView.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/17/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("👋 Welcome back, explorer!")
                    .font(.title2)
                    .bold()
                    .padding(.top)

                Text("Here's what your friends are sharing with their aliens.")
                    .foregroundColor(.gray)

                Divider()

                ForEach(0..<5, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text("Friend \(index + 1)'s alien 📸")
                            .font(.headline)
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 200)
                            .overlay(Text("AR Post"))
                            .cornerRadius(12)
                    }
                }
            }
            .padding()
        }
    }
}

