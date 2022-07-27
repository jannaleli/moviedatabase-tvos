//
//  WrapperViewController.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-06-04.
//

import Foundation
import UIKit
final class WrapperViewController: UIViewController {

    private let child: UIViewController

    init(child: UIViewController) {
        self.child = child
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        add(child)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        child.view.frame = view.bounds
    }
}
