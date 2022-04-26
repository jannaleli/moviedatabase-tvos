//
//  Movie.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-04.
//

import Foundation

public struct APIMovieTMDB: Codable {
    let results: [MovieData]
}

public struct MovieData: Codable, Identifiable {
    public let id: Int
    let original_title: String
    let overview: String
    let poster_path: String
}

struct MovieItemList: Codable {
    var results: [APIMovieTMDB]
}
