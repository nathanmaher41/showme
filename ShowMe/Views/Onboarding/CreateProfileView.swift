//
//  CreateProfileView.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/16/25.
//

import SwiftUI

struct CreateProfileView: View {
    @State private var name = ""
    @State private var age = ""
    @State private var bio = ""
    @State private var linkedSocials: [SocialPlatform: String] = [:]

    var onComplete: (UserProfile) -> Void
    
    struct BioTextEditor: View {
        @Binding var bio: String
        let characterLimit = 300

        var body: some View {
            VStack(alignment: .leading, spacing: 4) {
                ZStack(alignment: .topLeading) {
                    // Background & border to match TextField
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.secondarySystemBackground))
                        .frame(height: 100)

                    TextEditor(text: $bio)
                        .padding(8)
                        .frame(height: 100)
                        .background(Color.clear)
                        .onChange(of: bio) {
                            if bio.count > characterLimit {
                                bio = String(bio.prefix(characterLimit))
                            }
                        }

                    if bio.isEmpty {
                        Text("Bio (e.g. I love aliens & hiking)")
                            .foregroundColor(.gray)
                            .padding(12)
                    }
                }

                Text("\(bio.count)/\(characterLimit) characters")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Create Your Profile")
                    .font(.title)
                    .bold()
                    .padding(.top)

                TextField("Name", text: $name)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)

                TextField("Age", text: $age)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                BioTextEditor(bio: $bio)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Link Socials (optional)")
                        .font(.headline)

                    ForEach(SocialPlatform.allCases) { platform in
                        HStack {
                            Text(platform.icon)
                            TextField("\(platform.displayName) Username", text: Binding(
                                get: { linkedSocials[platform] ?? "" },
                                set: { linkedSocials[platform] = $0 }
                            ))
                            .textContentType(.username)
                            .padding(8)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(6)
                        }
                    }
                }

                Button(action: {
                    guard let ageInt = Int(age), ageInt >= 13 else {
                        // Optionally show alert
                        print("🚫 Must be 13 or older")
                        return
                    }

                    let profile = UserProfile(
                        name: name,
                        age: ageInt,
                        bio: bio,
                        linkedSocials: linkedSocials
                    )

                    onComplete(profile)
                }) {
                    Text("Finish")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding()
        }
    }
}
