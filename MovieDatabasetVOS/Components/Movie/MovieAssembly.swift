//
//  MovieAssembly.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-18.
//

import Foundation
import Swinject
import SwinjectAutoregistration

final class MovieAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(MovieViewModel.self, initializer:
                                DefaultMovieViewModel.init) //TODO: View Model
        container.register(MovieView.self) { resolver in
            MovieView(
                viewModel: resolver.resolve()
            )
        }
        container.autoregister(MovieViewController.self, initializer: MovieViewController.init)
    }
}
