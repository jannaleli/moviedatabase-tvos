//
//  MovieSession.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-19.
//

import Foundation
public protocol MovieSession {
    var http: HTTPSession { get set }
    func fetchMovies() async throws -> APIMovieTMDB
    func fetchGenres() async throws -> GenreList
}
