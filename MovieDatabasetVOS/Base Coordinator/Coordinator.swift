//
//  Coordinator.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-23.
//

import Foundation

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
