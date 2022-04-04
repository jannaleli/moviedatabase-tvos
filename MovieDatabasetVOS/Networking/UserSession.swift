//
//  UserSession.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-04.
//

import Foundation
import Combine

public enum DeviceType: String {
    case tv = "AppleTV"
}

public protocol UserSession {
    var isAuthenticated: Bool { get }
    var sessionEndedPublisher: AnyPublisher<Void, Never> { get }
    
    func fetchMovies() async 
    
}
