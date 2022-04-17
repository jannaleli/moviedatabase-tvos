//
//  AuthTokenStorage.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-09.
//

import Foundation
import Combine

public protocol AuthTokenStorage {
    var authToken: AuthToken? { get set }
    var authTokenPublisher: AnyPublisher<AuthToken?, Never> { get }
}
