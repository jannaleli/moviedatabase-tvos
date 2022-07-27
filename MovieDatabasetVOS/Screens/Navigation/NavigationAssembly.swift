//
//  NavigationAssembly.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-06-02.
//

import Foundation
import Swinject
import SwinjectAutoregistration

final class NavigationAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(NavigationViewModel.self, initializer:
                                DefaultNavigationViewModel.init).inObjectScope(.graph) //TODO: View Model
        container.autoregister(NavigationViewController.self, initializer: NavigationViewController.init) //TODO: View Controller
        container.autoregister(TabViewController.self, initializer:
                                TabViewController.init) //TODO: View Model      }
        container.autoregister(TabUIView.self, initializer: TabUIView.init)

    }
}
