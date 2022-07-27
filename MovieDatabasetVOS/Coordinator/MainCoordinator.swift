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
    
    private enum Screen {
        case menu
    }
    
    var childCoordinators = [Coordinator]()
    
     var navigationController: UINavigationController?
    
    private let assembler: Assembler
    
    var window = UIWindow()
    
    weak var delegate: MainCoordinatorDelegate?
    
    private var coordinators: [Screen: Coordinator] = .init()
    
    // MARK: - Initialization

    init(assembler: Assembler) {
        navigationController = UINavigationController()
        self.window = UIWindow()
        self.assembler = assembler

    }
    
    func start() {
       // showMain()
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
    

    
    private func showMenu() {
        let menu = NavigationCoordinator(assembler: assembler)
        coordinators[.menu] = menu
        menu.start()
        navigationController?.setViewControllers([menu.viewController], animated: true)
    }
    
    private func showSwimlane() {
        let swimlane: RailViewController = assembler.resolve()
        navigationController?.pushViewController(swimlane, animated: true)
    }
}

extension MainCoordinator: LoginCoordinatorDelegate {
    func didLogin(_ sender: LoginCoordinator) {
        print("We're now in main")
        self.showMenu()
    }
    

    
}

