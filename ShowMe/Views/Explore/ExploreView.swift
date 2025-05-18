//
//  ExploreView.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/17/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("🔥 Explore")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)

                // Search Bar
                TextField("Search users, aliens, or places", text: $searchText)
                    .padding(10)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.horizontal)

                LazyVGrid(columns: columns, spacing: 4) {
                    ForEach(0..<18, id: \.self) { index in
                        Rectangle()
                            .fill(Color.blue.opacity(0.3))
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(Text("🌍"))
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
