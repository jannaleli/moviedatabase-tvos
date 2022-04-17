//
//  UserSession.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-04.
//

import Foundation
import Combine
import Firebase

public enum DeviceType: String {
    case tv = "AppleTV"
}

public protocol UserSession {
    var isAuthenticated: Bool {get }
    var sessionEndedPublisher: AnyPublisher<Void, Error> { get }
    //    func fetchMovies() async
    //    func invalidate()
    ///Firebase already has a model that we can use. At the very least, let's use this.
    func login(username: String, password: String) async throws -> Future<User?, Error>
}

