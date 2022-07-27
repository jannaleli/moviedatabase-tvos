//
//  GenreViewModel.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-21.
//

import Foundation
import Combine


final class GenreViewModel: ObservableObject, Identifiable {
    @Published var title: String = "Genre"
    @Published var items: [Genre] = []
    
    private let movieSession: MovieSession
    
    init(movieSession: MovieSession) {
        self.movieSession = movieSession
    }
    
    @MainActor
    func prepare() async throws {
        //We map the CatalogCard here in the original caode
        //This is where CatalogCardViewModel is mapped
        print("prepare GenreViewModel")
        let results = try await movieSession.fetchGenres()
        items = results.genres
        print(items)
        
        
    }

}
