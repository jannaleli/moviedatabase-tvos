//
//  PlayerViewController.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-28.
//

import  SwiftUI

protocol PlayerViewControllerDelegate: AnyObject {
    func didDismiss(_ sender: PlayerViewController)
    func didFaiWithError(_ sender: PlayerViewController, error: Error)
}

final class PlayerViewController: UIHostingController<PlayerView> {
    weak var delegate: PlayerViewControllerDelegate?
    deinit {
        delegate?.didDismiss(self)
    }
    
//    #if os(iOS)
//    override var prefersHomeIndicatorAutoHidden: Bool {
//        true
//    }
//    #endif
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        rootView.viewModel.onWillDisappear()
    }
}
