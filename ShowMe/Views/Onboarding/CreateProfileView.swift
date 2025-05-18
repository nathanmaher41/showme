//
//  CreateProfileView.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/16/25.
//

import SwiftUI

struct CreateProfileView: View {
    @State private var name = ""
    @State private var birthdate = Calendar.current.date(byAdding: .year, value: -18, to: Date()) ?? Date()
    @State private var bio = ""
    @State private var linkedSocials: [SocialPlatform: String] = [:]

    var onComplete: (UserProfile) -> Void
    
    struct BioTextEditor: View {
        @Binding var bio: String
        let characterLimit = 300

        var body: some View {
            VStack(alignment: .leading, spacing: 6) {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        .background(Color(.systemGray6)) // matches other fields
                        .cornerRadius(10)
                        .frame(height: 120)

                    TextEditor(text: $bio)
                        .frame(height: 120)
                        .padding(8)
                        .background(Color.clear)
                        .onChange(of: bio) {
                            if bio.count > characterLimit {
                                bio = String(bio.prefix(characterLimit))
                            }
                        }

                    if bio.isEmpty {
                        Text("Bio (e.g. I love aliens & hiking)")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 12)
                    }
                }

                Text("\(bio.count)/\(characterLimit) characters")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.leading, 4)
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

                DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)
                    .datePickerStyle(.compact) // 👈 Shows dropdown-style picker
                    .labelsHidden() // hides the default label if you want
                    .frame(maxWidth: .infinity, alignment: .leading)
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
                    let ageComponents = Calendar.current.dateComponents([.year], from: birthdate, to: Date())
                    guard let age = ageComponents.year, age >= 13 else {
                        print("🚫 Must be 13 or older")
                        return
                    }


                    let profile = UserProfile(
                        name: name,
                        birthdate: birthdate,
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
