//
//  UserProfile.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/16/25.
//

// Models/UserProfile.swift

struct UserProfile {
    var name: String
    var age: Int
    var bio: String
    var linkedSocials: [SocialPlatform: String]
}

enum SocialPlatform: String, CaseIterable, Identifiable {
    case instagram, x, facebook, snapchat, tiktok, vsco

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .instagram: return "📸"
        case .x: return "❌"
        case .facebook: return "🅕"
        case .snapchat: return "👻"
        case .tiktok: return "🎥"
        case .vsco: return "V"
        }
    }

    var displayName: String {
        switch self {
        case .x: return "X"
        default: return rawValue.capitalized
        }
    }
}
