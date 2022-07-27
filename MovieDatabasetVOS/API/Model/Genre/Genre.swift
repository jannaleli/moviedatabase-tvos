//
//  Genre.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-21.
//

import Foundation

public struct GenreList: Codable {
    var genres: [Genre]
}

public struct Genre: Codable, Identifiable {
    public var id: Int
    var name: String
}


