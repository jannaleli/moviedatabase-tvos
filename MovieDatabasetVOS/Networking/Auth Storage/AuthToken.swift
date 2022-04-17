//
//  AuthToken.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-09.
//

import Foundation

public struct AuthToken: Codable {
    public let accessToken: String
    public let refreshToken: String
    public let tokenExpires: Date
}

extension AuthToken {
    public var isExpired: Bool {
        (Date() - 10 * 60) > tokenExpires
    }
}
