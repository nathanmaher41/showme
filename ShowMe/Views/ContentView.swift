//
//  ContentView.swift
//  ShowMe
//
//  Created by Nathan Maher on 4/29/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var hasProfile = false
    @State private var hasCreatedAlien = false

    @State private var userProfile: UserProfile?
    @State private var alienName: String?

    var body: some View {
        if !isLoggedIn {
            AuthView(onLogin: {
                isLoggedIn = true
            })
        } else if !hasProfile {
            CreateProfileView { profile in
                userProfile = profile
                hasProfile = true
            }
        } else if !hasCreatedAlien {
            AlienCreationView(onComplete: { name in
                alienName = name
                hasCreatedAlien = true
            })
        } else {
            MainTabView()
        }
    }
}




#Preview {
    ContentView()
}
