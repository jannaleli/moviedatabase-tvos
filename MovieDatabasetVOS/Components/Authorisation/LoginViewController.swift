//
//  LoginViewController.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-23.
//

import Foundation
import UIKit

public protocol LoginViewControllerDelegate: AnyObject {
    func loginCompleted()
}

class LoginViewController: UIViewController {

    weak var delegate: LoginViewControllerDelegate?
    var loginView = LoginView()
    
    
    override func loadView() {
        loginView.delegate = self
        view = loginView
    }
}

extension LoginViewController: LoginViewDelegate {
    func loginSelected() {
        delegate?.loginCompleted()
    }
}
