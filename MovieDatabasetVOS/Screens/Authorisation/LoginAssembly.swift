//
//  LoginAssembler.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-12.
//

import Foundation
import Swinject
import SwinjectAutoregistration

final class LoginAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(LoginViewModel.self, initializer:
                                DefaultLoginViewModel.init) //TODO: View Model
        container.register(LoginView.self) { resolver in
            LoginView(
                viewModel: resolver.resolve()
            )
        }
        container.autoregister(LoginViewController.self, initializer: LoginViewController.init) //TODO: View Controller
    }
}
