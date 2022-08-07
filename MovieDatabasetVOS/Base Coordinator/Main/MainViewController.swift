//
//  MainViewController.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-30.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let contentViewController: UIViewController
    private let overlayViewController: UIViewController
    
    init(contentViewController: UIViewController, overlayViewController: UIViewController) {
        self.contentViewController = contentViewController
        self.overlayViewController = overlayViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        add(contentViewController)
        add(overlayViewController)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentViewController.view.frame = view.bounds
        overlayViewController.view.frame = view.bounds
    }
}
