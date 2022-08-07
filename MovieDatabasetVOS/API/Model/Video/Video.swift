//
//  Video.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-30.
//

import Foundation

public struct APIVideoTMDB: Codable {
    let results: [Video]
}

public struct Video: Codable {
    public let id: String
    public let name: String
    public let key: String
    public let site: String
    
//    public init(
//        id: String,
//        name: String,
//        key: String,
//        site: Site
//    ) {
//        self.id = id
//        self.name = name
//        self.key = key
//        self.site = site
//    }
}

extension Video:  Equatable {
    public enum Site: String, Codable, Equatable {
        case youtube = "YouTube"
        case unknown
    }
    public enum Content: Codable, Equatable {
        case trailer
        case teaser
        case behindTheScenes
        case featurette
        case clip
        case unknown
    }
}

extension Video.Content: CustomStringConvertible {
    public var description: String {
        switch self {
        case .trailer: return "Trailer"
        case .teaser: return "Teaser"
        case .behindTheScenes: return "Behind the scenes"
        case .featurette: return "Featurette"
        case .clip: return "Clip"
        case .unknown: return "Unknown"
        }
    }
}
