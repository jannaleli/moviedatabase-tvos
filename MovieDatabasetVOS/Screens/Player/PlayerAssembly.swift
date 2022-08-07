//
//  File.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-28.
//

import Foundation
import Swinject

final class PlayerAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(PlayerViewController.self, initializer: PlayerViewController.init)
        container.autoregister(PlayerViewModel.self, initializer: YoutubePlayerViewModel.init)
        container.autoregister(PlayerView.self, initializer: PlayerView.init)
        container.autoregister(WatchActivityService.self, initializer: DefaultWatchActivityService.init).inObjectScope(.container)
    }
}
