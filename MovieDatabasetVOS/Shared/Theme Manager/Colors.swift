//
//  Color.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-24.
//

import Foundation
import UIKit
import SwiftUI

struct Colors {
    // TODO: map all colours from Figma Design System
    let whitePure: Color
    let snowWhite: Color
    let epicoBlueStop1: Color
    let epicoBlueStop2: Color
}

extension Colors {
    static let `default`: Self = .init(
        whitePure: .make(rgb: "FFFFFF", alpha: 1.0),
        snowWhite: .make(rgb: "FFFFFF", alpha: 1.0),
        epicoBlueStop1: .make(rgb: "004282", alpha: 1.0),
        epicoBlueStop2: .make(rgb: "001E62", alpha: 1.0)
    )
}


extension Color {
    public static func make(rgb: String, alpha: CGFloat) -> Color {
        Color(UIColor(hexString: rgb).withAlphaComponent(alpha))
    }
}

extension UIColor {
    public convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

