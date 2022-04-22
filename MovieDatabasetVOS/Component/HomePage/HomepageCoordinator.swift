//
//  HomepageCoordinator.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-21.
//

import Foundation
import UIKit
import Swinject

final class HomepageCoordinator: Coordinator {
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
