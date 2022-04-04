//
//  ActivationCoordinator.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-23.
//

import Foundation

import UIKit

protocol ActivationCoordinatorDelegate: AnyObject {
    func goToRegistrationCodeView()
}


final class ActivationCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    weak var navigationController: UINavigationController?
    
    weak var delegate: ActivationCoordinatorDelegate?
    
    var window = UIWindow()
    
    
    // MARK: - Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        startActivationView()
        loading()
    }
    // MARK: - Private Methods

    private func loading() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func startActivationView() {
        let activationViewController = ActivViewControllerHosting(rootView: AuthViewSwiftUI())
        activationViewController.delegate = self
        navigationController?.viewControllers = [activationViewController]
    }
    
    private func startRegistrationCodeScreen() {
        
    }
}

extension ActivationCoordinator: ActivViewControllerHostingDelegate {
    func didDismiss(_ sender: ActivViewControllerHosting) {
        
    }
    
    
}

//extension ActivationCoordinator: ActivationViewControllerDelegate {
//    func changeLanguage() {
//        print("Change Language")
//    }
//    
//    func goToRegisterCode() {
//        print("Go To Register Code Screen")
//    }
//    
//    
//}


