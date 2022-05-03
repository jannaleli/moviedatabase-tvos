//
//  HomepageAssembly.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-21.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import SwiftUI

final class HomeAssembly: Assembly {
    func assemble(container: Container) {
           container.autoregister(HomepageViewModel.self, initializer:
                                                DefaultHomepageViewModel.init) //TODO: View Model
            container.register(HomepageView.self) { resolver in
                            HomepageView(
                                viewModel: resolver.resolve()
                            )
                        }
            container.register(Navigation.self) { resolver in
                            Navigation(
                                viewModel: resolver.resolve()
                            )
                        }
            container.autoregister(HomepageViewController.self, initializer: HomepageViewController.init) //TODO: View Controller
    }
}
