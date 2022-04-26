//
//  HomepageCoordinator.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-21.
//

import Foundation
import UIKit
import Swinject

protocol HomepageCoordinatorDelegate: AnyObject {
    
}

final class HomepageCoordinator: Coordinator {
    
    weak var delegate: HomepageCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    
    private var viewController: UIViewController {
        homepageViewController
    }
    
    private let assembler: Assembler
    
    var homepageViewController: HomepageViewController
    
    init(assembler: Assembler) {
        self.assembler = assembler
        self.homepageViewController = assembler.resolve()
        
    }
    
    func start() {
        
    }
}
