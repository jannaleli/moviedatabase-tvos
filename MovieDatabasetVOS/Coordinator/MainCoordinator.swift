//
//  AuthCoordinator.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-23.
//

import Foundation
import UIKit
import Swinject

protocol MainCoordinatorDelegate: AnyObject {
    func authIsCompleted()
}

final class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
     var navigationController: UINavigationController?
    
    private let assembler: Assembler
    
    var window = UIWindow()
    
    weak var delegate: MainCoordinatorDelegate?
    
    // MARK: - Initialization

    init(assembler: Assembler) {
        navigationController = UINavigationController()
        self.window = UIWindow()
        self.assembler = assembler

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
        let coordinator = LoginCoordinator(assembler: assembler)
        coordinator.delegate = self
        childCoordinators = [coordinator]
        coordinator.start()
        navigationController?.setViewControllers([coordinator.loginViewController], animated: false)
    }
    
    private func showMain() {
        
    }
}

extension MainCoordinator: LoginCoordinatorDelegate {
    func didLogin(_ sender: LoginCoordinator) {
    
    }
    

    
}
