//
//  ActivViewControllerHosting.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-24.
//

import Foundation
import SwiftUI


protocol ActivViewControllerHostingDelegate: AnyObject {
    func didDismiss(_ sender: ActivViewControllerHosting)
}

final class ActivViewControllerHosting: UIHostingController<AuthViewSwiftUI> {
    
    weak var delegate: ActivViewControllerHostingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //rootView.viewModel.delegate = self
    }
    
    deinit {
        delegate?.didDismiss(self)
    }
}

// MARK: - VideosViewModelDelegate


