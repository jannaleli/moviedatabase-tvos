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
    private let watchActivityService: WatchActivityService
    
    init(movieSession: MovieSession,
         watchActivityService: WatchActivityService) {
        self.movieSession = movieSession
        self.watchActivityService = watchActivityService
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
    @MainActor
    func handle(movieId: String) async throws {
        print("handling")
        let result = try await movieSession.fetchVideos(movieId: movieId)
        let id = result.results.first?.key
        
        watchActivityService.prepareToPlay(video: result.results.first!)
        
    }

}
