//
//  HomepageAssembly.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-21.
//

import Foundation
import Swinject
import SwinjectAutoregistration

final class HomeAssembly: Assembly {
    func assemble(container: Container) {
           container.autoregister(LoginViewModel.self, initializer:
                                                DefaultLoginViewModel.init) //TODO: View Model
            container.register(HomepageView.self) { resolver in
                            HomepageView(
                                viewModel: resolver.resolve()
                            )
                        }
            container.autoregister(HomepageViewController.self, initializer: HomepageViewController.init) //TODO: View Controller
    }
}
