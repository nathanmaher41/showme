//
//  CGSize+Add.swift
//  ShowMe
//
//  Created by Nathan Maher on 5/16/25.
//

import CoreGraphics

extension CGSize {
    static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}
