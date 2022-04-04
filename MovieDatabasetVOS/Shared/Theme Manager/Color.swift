//
//  Color.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-24.
//

import Foundation
import UIKit

struct Colors {
    // TODO: map all colours from Figma Design System
    let whitePure: UIColor
    let colorTop: UIColor
    let colorBottom: UIColor
}

extension Colors {
    static let `default`: Self = .init(
        whitePure: .white,
        colorTop: UIColor(red: 192.0/255.0, green: 38.0/255.0, blue: 42.0/255.0, alpha: 1.0),
        colorBottom: UIColor(red: 35.0/255.0, green: 2.0/255.0, blue: 2.0/255.0, alpha: 1.0)

    )
}
