//
//  ErrorCoordinator.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-30.
//
import UIKit
import Swinject
final class ErrorCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var viewController: UIViewController { toastViewController }
    private let toastViewController: ErrorViewController
    
    init(assembler: Assembler) {
        toastViewController = assembler.resolver.resolve()
    }
    
    func start() {}
}
