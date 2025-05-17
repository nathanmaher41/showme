//
//  LoginFormView.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/16/25.
//
import SwiftUI

struct LoginFormView: View {
    @State private var email = ""
    @State private var password = ""
    var onLogin: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)

            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)

            Button(action: {
                print("Mock login with \(email)")
                onLogin() // tell ContentView we're "logged in"
            }) {
                Text("Log In")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
