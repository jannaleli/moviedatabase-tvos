//
//  LoginCoordinator.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-12.
//

import Foundation
import Swinject
import UIKit


protocol LoginCoordinatorDelegate: AnyObject {
    func didLogin(_ sender: LoginCoordinator)
}

final class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    weak var delegate: LoginCoordinatorDelegate?
    
    private var viewController: UIViewController { loginViewController }
    
    private let assembler: Assembler
    
    var loginViewController: LoginViewController
    
    init(assembler: Assembler) {
        self.assembler = assembler
        self.loginViewController = assembler.resolve()
        self.loginViewController.delegate = self
    }
    
    func start() {
        
    }
    
    
}

// MARK - ActivationViewControllerDelegate

extension LoginCoordinator: LoginViewControllerDelegate {
    func loginCompleted() {
        
    }
    
}
