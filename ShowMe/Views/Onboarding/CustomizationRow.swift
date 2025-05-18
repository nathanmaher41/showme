//
//  CustomizationRow.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/17/25.
//

import SwiftUI

struct CustomizationRow: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .bold()
            Spacer()
            Text("Default")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
    }
}
