//
//  NavigationCoordination.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-06-02.
//

import Foundation
import Swinject


final class NavigationCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    lazy var viewController: UIViewController = WrapperViewController(child: navigationController)
    private let navigationController = UINavigationController()
    private let assembler: Assembler
    private let navViewController: NavigationViewController
    
    
    init(assembler: Assembler) {
        print("navigation coordinator is starting")
        self.assembler = assembler
        navViewController = assembler.resolve()
        
        self.navViewController.delegate = self
        
    }
    
    func start() {
        navigationController.setViewControllers([navViewController], animated: true)
        let args = RailArguments(tabId: "movie", handler: self)
        let vc: RailViewController = assembler.resolve(argument: args)
       // navigationController.pushViewController(vc, animated: true)
        navViewController.contentViewController = vc
    }
    
    private func showPage(page: String) {
        switch page {
        case "movie": break //This is where we set the navViewController and then content View Controller so how do we do that hehe
        case "genre": break
        default:
            break
        }
    }
    
    private func showGenre() {
        let args = RailArguments(tabId: "genre", handler: self)
        let vc: RailViewController = assembler.resolve(argument: args)
        navViewController.contentViewController = vc
        
    }
    
    private func showMovie() {
        let args = RailArguments(tabId: "movie", handler: self)
        let vc: RailViewController = assembler.resolve(argument: args)
        navViewController.contentViewController = vc
    }
    
    
}

extension NavigationCoordinator: NavigationViewControllerDelegate {
    func didSelectItem(_ sender: NavigationViewController, item: String) {
        showGenre()
    }
    
    
}

extension NavigationCoordinator: NavigationActionHandler {
    //I think the problem is how to reach to this screen
    
    func handle(_ action: NavigationAction) {
        switch action {
        case .genre: showGenre()
            break
        case .movies: showMovie()
            break
        case .play(let playId): break
        case .show(let seriesId):
            break
        case .unknown:
            break
        }
    }
}
