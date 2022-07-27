//
//  RailType.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-21.
//

import Foundation
import Combine


enum RailType {
    case movie(MovieViewModel)
    case genre(GenreViewModel)
}

extension RailType: Identifiable {
    var id: String {
        switch self {
        case .movie: return "movie"
        case .genre: return "genre"
        }
    }
    
    func prepare() async throws {
        switch self {
        case .movie(let vm):
            try await vm.prepare()
        case .genre(let vm):
            try await vm.prepare()
        }
    }
}
