//
//  CardType.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-21.
//

import UIKit

enum CardType {
    case regular
    
    var size: CGSize {
        switch self {
        case .regular:
            return .regularCard
        }
    }
}
