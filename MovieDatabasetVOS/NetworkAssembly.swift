//
//  NetworkAssembly.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-13.
//

import Foundation
import Swinject
import SwinjectAutoregistration

final class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(UserSession.self, initializer:
                                DefaultUserSession.init) //TODO: View Model
    }
}
