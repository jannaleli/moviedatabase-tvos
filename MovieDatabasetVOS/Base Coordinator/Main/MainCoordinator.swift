//
//  AuthCoordinator.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-23.
//

import Foundation
import UIKit
import Swinject
import Combine

protocol MainCoordinatorDelegate: AnyObject {
    func authIsCompleted()
}

final class MainCoordinator: Coordinator {
    
    private enum Screen {
        case menu
        case toast
    }
    
    var childCoordinators = [Coordinator]()
    
     var navigationController: UINavigationController?
    
    private let assembler: Assembler
    
    var window = UIWindow()
    
    weak var delegate: MainCoordinatorDelegate?
    
    var viewController: UIViewController { mainViewController }
    
    private let mainViewController: MainViewController
    
    private var coordinators: [Screen: Coordinator] = .init()
    private var bag = Set<AnyCancellable>()
    
    private let watchActivityService: WatchActivityService
    private var playerCoordinator: PlayerCoordinator?
    // MARK: - Initialization

    init(assembler: Assembler) {
        navigationController = UINavigationController()

        self.window = UIWindow()
        self.assembler = assembler
        self.watchActivityService = assembler.resolver.resolve()
        
        let toast = ErrorCoordinator(assembler: assembler)
        coordinators[.toast] = toast
        toast.start()
        
        let menu = NavigationCoordinator(assembler: assembler)
        coordinators[.menu] = menu
        menu.start()
        self.mainViewController = MainViewController(
            contentViewController: menu.viewController,
            overlayViewController: toast.viewController
        )
        self.watchActivityService
            .enqueuedVideo
            .throttle(for: 1, scheduler: RunLoop.main, latest: true)
            .sink { [weak self] video in
                if let _ = video {
                    self?.showPlayer()
                } else {
                    self?.dismissPlayer()
                }
            }
            .store(in: &bag)
        

    }
    
    func start() {
       // showMain()
        startLoginView()
        loading()
    }
    // MARK: - Private Methods

    private func loading() {
        window.rootViewController = mainViewController //navigationController
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
    
    private func dismissPlayer() {
        mainViewController.dismiss(animated: true)
    }
    
    private func showPlayer() {
        guard playerCoordinator == nil else { return }
        let coordinator = PlayerCoordinator(viewController: mainViewController, assembler: assembler)
        coordinator.delegate = self
        coordinator.start()
        playerCoordinator = coordinator
    }
}

extension MainCoordinator: LoginCoordinatorDelegate {
    func didLogin(_ sender: LoginCoordinator) {
        print("We're now in main")
        self.showMenu()
    }
    

    
}

extension MainCoordinator: PlayerCoordinatorDelegate {
    func didFinish(_ sender: PlayerCoordinator) {
        playerCoordinator = nil
    }
}


