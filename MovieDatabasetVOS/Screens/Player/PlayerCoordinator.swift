//
//  PlayerCoordinator.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-28.
//

import Foundation
import Swinject

protocol PlayerCoordinatorDelegate: AnyObject {
    func didFinish(_ sender: PlayerCoordinator)
}

final class PlayerCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    
    
    weak var delegate: PlayerCoordinatorDelegate?
    
    private let viewController: UIViewController
    private let assembler: Assembler
    
    init(viewController: UIViewController, assembler: Assembler) {
        self.viewController = viewController
        self.assembler = assembler
    }
    
    func start() {
        let vc = makePlayer()
        vc.modalPresentationStyle  = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewController.present(vc, animated: true)
    }
    
    private func makePlayer() -> PlayerViewController {
        // Resolver resolve? Hmm let me see how this is implemented on our end
        let vc: PlayerViewController = assembler.resolver.resolve()
        vc.delegate = self
        return vc
    }
}
// MARK: - PlayerViewControllerDelegate

extension PlayerCoordinator: PlayerViewControllerDelegate {

    

    
    func didDismiss(_ sender: PlayerViewController) {
        delegate?.didFinish(self)
    }
    func didFaiWithError(_ sender: PlayerViewController, error: Error) {
        sender.dismiss(animated: true)
    }
}
