//
//  MissionsView.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/17/25.
//
import SwiftUI

struct MissionsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("🎯 Daily Mission")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)

                Text("Show your alien something that makes you laugh 😂")
                    .font(.headline)
                    .padding(.horizontal)

                Button(action: {
                    print("Start mission")
                }) {
                    Text("Take Photo")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Divider().padding(.vertical)

                Text("📅 Mission History")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                ForEach(1..<6) { day in
                    HStack {
                        Text("Day \(day)")
                        Spacer()
                        Text("📷 Completed")
                            .foregroundColor(.green)
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
            }
        }
    }
}

