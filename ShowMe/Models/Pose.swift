//
//  Pose.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/16/25.
//
import UIKit
enum Pose: String, CaseIterable, Identifiable {
    case idle
    case wave
    case sit
    case dance

    var id: String { rawValue }

    // Placeholder color for each pose (real app = animation trigger)
    var color: UIColor {
        switch self {
        case .idle: return .green
        case .wave: return .blue
        case .sit: return .orange
        case .dance: return .purple
        }
    }
}
