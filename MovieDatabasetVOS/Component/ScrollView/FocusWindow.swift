//
//  FocusWindow.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-04.
//

import Foundation
import UIKit

final class FocusWindow: UIWindow {
    
    weak var focusedView: UIView?
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        focusedView = context.nextFocusedView
    }
    
}
