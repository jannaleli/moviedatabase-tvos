//
//  HTTPError.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-07.
//

import Foundation
public enum HTTPError: Error {
    /// Indicates that the requested `URL` is invalid.
    case invalidRequest(request: HTTPRequest)
    /// Indicates that the response is not a valid HTTP response.
    case invalidResponse(response: URLResponse)
    /// Indicates that raw data could not be decoded
    case cannotDecodeRawData
    /// Indicates that the response code is not the expected in a request with no content response
    case invalidCodeResponse
}
