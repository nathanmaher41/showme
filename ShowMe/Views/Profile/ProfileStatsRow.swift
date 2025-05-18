//
//  ProfileStatsRow.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/17/25.
//

import SwiftUI

struct ProfileStatsRow: View {
    var posts: Int
    var followers: Int
    var following: Int
    var friends: Int

    var body: some View {
        HStack(spacing: 0) {
            statItem(count: posts, label: "Posts")
            Spacer()
            statItem(count: followers, label: "Followers")
            Spacer()
            statItem(count: following, label: "Following")
            Spacer()
            statItem(count: friends, label: "Friends")
        }
    }

    func statItem(count: Int, label: String) -> some View {
        VStack {
            Text("\(count)")
                .font(.headline)
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}
