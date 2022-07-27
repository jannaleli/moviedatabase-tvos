//
//  FocusView.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-06-13.
//

import UIKit

final class FocusView: UIView {

    var isFocusable: Bool = true

    override var canBecomeFocused: Bool {
        isFocusable
    }
}
