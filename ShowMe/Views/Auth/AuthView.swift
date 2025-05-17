//
//  AuthView.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/16/25.
//

import SwiftUI

struct AuthView: View {
    @State private var isLoginMode = true
    var onLogin: () -> Void

    var body: some View {
        VStack(spacing: 32) {
            Text(isLoginMode ? "Login" : "Create Account")
                .font(.largeTitle)
                .bold()
                .padding(.top, 50)

            if isLoginMode {
                LoginFormView(onLogin: onLogin)
            } else {
                SignupFormView(onSignup: onLogin)
            }

            Button(action: {
                isLoginMode.toggle()
            }) {
                Text(isLoginMode ? "Don't have an account? Sign Up" : "Already have an account? Log In")
                    .font(.footnote)
                    .foregroundColor(.blue)
            }

            Spacer()
        }
        .padding()
    }
}

