//
//  RailFactory.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-26.
//

import Foundation

protocol RailFactory {
    func makeViewModel(rail: String) -> RailType?
}

final class DefaultRailFactory: RailFactory {
    func makeViewModel(rail: String) -> RailType? {
        switch rail {
        case "movie":
            return .movie(.init(movieSession: movieSession))
        case "genre":
            return .genre(.init(movieSession: movieSession))
        default:
            return .genre(.init(movieSession: movieSession))
        }
    }
    
    private let movieSession: MovieSession
    
    init(movieSession: MovieSession) {
        self.movieSession = movieSession
    }
}
