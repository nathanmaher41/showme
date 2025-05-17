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
    @State private var userProfile: UserProfile?

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
        } else {
            if let testImage = UIImage(named: "samplePhoto") {
                AlienStudioView(photo: testImage)
            } else {
                Text("No test image found.")
            }
        }
    }
}


#Preview {
    ContentView()
}
