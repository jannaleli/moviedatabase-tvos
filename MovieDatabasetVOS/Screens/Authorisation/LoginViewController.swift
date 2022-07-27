//
//  LoginViewController.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-23.
//

import Foundation
import SwiftUI
import Firebase

public protocol LoginViewControllerDelegate: AnyObject {
    func loginCompleted()
}

final class LoginViewController: UIHostingController<LoginView> {

    weak var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        ///TODO: Place a viewModel delegate here since I think we are using viewModel
        ///as a gateway between SwiftUI Views and ViewController
        ///Done
        rootView.viewModel.delegate = self
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func didLogin(_ user: User) {
        delegate?.loginCompleted()
    }
    
 
    
}



