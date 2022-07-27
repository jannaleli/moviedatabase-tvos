//
//  MovieViewModel.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-21.
//

import Foundation

final class MovieViewModel: ObservableObject, Identifiable {
    @Published var title: String = "Movie"
    @Published var items: [MovieData] = []
    private let movieSession: MovieSession
    
    init(movieSession: MovieSession) {
        self.movieSession = movieSession
    }
    
    @MainActor
    func prepare() async throws {
        //We map the CatalogCard here in the original caode
        print("prepare MovieViewModel")
        // TODO: Put a try/catch here and then throw an exception ALWAYS
        let result = try await movieSession.fetchMovies()
        items = result.results
        print(items)
    }

}
