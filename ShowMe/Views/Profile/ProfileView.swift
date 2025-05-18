//
//  ProfileView.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/17/25.
//

import SwiftUI

struct ProfileView: View {
    // Mock data
    @State private var username: String = "AlienFan42"
    @State private var bio: String = "Exploring Earth with my alien friend 🌍👽"
    @State private var postCount = 12
    @State private var followers = 128
    @State private var following = 87
    @State private var friends = 3

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Alien Model in center
                AlienPreviewView()
                    .frame(height: 220)
                    .padding(.top)

                HStack {
                    Text(username)
                        .font(.title2)
                        .bold()
                    Spacer()
                    Button("Edit Profile") {
                        // Future: go to edit screen
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                }

                Text(bio)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)

                ProfileStatsRow(
                    posts: postCount,
                    followers: followers,
                    following: following,
                    friends: friends
                )

                Divider()

                PostGridView(postCount: postCount)
            }
            .padding(.horizontal)
        }
    }
}
