//
//  ErrorAssembly.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-30.
//

import Foundation
import Swinject
import SwinjectAutoregistration

final class ErrorAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(ErrorViewModel.self, initializer: DefaultErrorViewModel.init)
            .inObjectScope(.container)
        container.autoregister(ErrorView.self, initializer: ErrorView.init)
        container.autoregister(ErrorViewController.self, initializer: ErrorViewController.init)
    }
}
