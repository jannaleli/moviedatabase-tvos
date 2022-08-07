//
//  HTTPSession.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-07.
//

import Foundation
import Combine

/// A type that can inspect and optionally adapt a URLRequest in some manner if necessary
public protocol RequestAdapter {
    func adapt(_ request: URLRequest) async throws -> URLRequest
}

/// Outcome determination whether retry is necessary

public enum RetryResult {
    case retry
    case doNotRetry
}

/// A type that determines whether a request should be retried after being executed after encountering an error

public protocol RequestRetrier {
    func retry(_ request: URLRequest, dueTo error: Error) async throws -> RetryResult
}

public protocol HTTPSession: AnyObject {
    var requestAdapter: RequestAdapter? { get set }
    var requestRetrier: RequestRetrier? { get set }
    func data(request: URLRequest) async throws -> (data: Data, response: HTTPURLResponse)
    func data<Mapper: HTTPResponseMapper>(request: URLRequest, mapper: Mapper) async throws -> Mapper.Output
    func data<Mapper: HTTPResponseMapper>(request: HTTPRequest, mapper: Mapper) async throws -> Mapper.Output
}
