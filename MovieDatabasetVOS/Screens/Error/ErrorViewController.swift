//
//  ErrorViewController.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-30.
//

import UIKit
import SwiftUI

final class ErrorViewController: UIHostingController<ErrorView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = false
    }
}
