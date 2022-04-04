//
//  AuthCoordinator.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-23.
//

import Foundation
import UIKit

protocol AuthCoordinatorDelegate: AnyObject {
    func authIsCompleted()
}

final class AuthCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
     var navigationController: UINavigationController?
    
    var window = UIWindow()
    
    weak var delegate: AuthCoordinatorDelegate?
    
    // MARK: - Initialization

    init() {
        navigationController = UINavigationController()
        self.window = UIWindow()

    }
    
    func start() {
        startLoginView()
        loading()
    }
    // MARK: - Private Methods

    private func loading() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func startLoginView() {
        let coordinator = ActivationCoordinator(navigationController: navigationController!)
        coordinator.delegate = self
        childCoordinators = [coordinator]
        coordinator.start()
    }
}

extension AuthCoordinator: ActivationCoordinatorDelegate {

    
    func goToRegistrationCodeView() {
        print("Go To Registration Code View")
    }
    

    

    
    
}
