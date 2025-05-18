//
//  MainTabView.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/17/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }

            CreatePostView()
                .tabItem {
                    Image(systemName: "plus.app.fill")
                    Text("Create")
                }

            MissionsView()
                .tabItem {
                    Image(systemName: "bolt.fill")
                    Text("Missions")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}
