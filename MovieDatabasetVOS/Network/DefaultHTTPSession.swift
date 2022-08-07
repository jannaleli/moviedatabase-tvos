//
//  DefaultHTTPSession.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-07.
//

import Foundation
import Combine

public final class DefaultHTTPSession {
    
    public var requestAdapter: RequestAdapter?
    public var requestRetrier: RequestRetrier?
    
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    private func adaptRequestIfNeeded(_ request: URLRequest) async throws -> URLRequest {
        if let adapter = requestAdapter {
            return try await adapter.adapt(request)
        } else {
            return request
        }
    }
    
    private func retryRequestIfNeeded(_ request: URLRequest, dueTo error: Error) async throws -> (data: Data, response: HTTPURLResponse) {
        if let retrier = requestRetrier {
            let result = try await retrier.retry(request, dueTo: error)
            switch result {
            case .retry:
                return try await data(request: request)
            case .doNotRetry:
                throw error
            }
        } else {
            throw error
        }
    }
}
// MARK: - HTTPSession
extension DefaultHTTPSession: HTTPSession {
    public func data(request: URLRequest) async throws -> (data: Data, response: HTTPURLResponse) {
        let request = try await adaptRequestIfNeeded(request)
        do {
            return try await session.fetch(for: request)
        } catch {
            return try await retryRequestIfNeeded(request, dueTo: error)
        }
    }
    
    public func data<Mapper: HTTPResponseMapper>(request: URLRequest, mapper: Mapper) async throws -> Mapper.Output {
        let (data, response) = try await data(request: request)
        return try mapper.map(data: data, response: response)
    }
    
    public func data<Mapper: HTTPResponseMapper>(request: HTTPRequest, mapper: Mapper) async throws -> Mapper.Output {
        try await data(request: try URLRequest(request: request), mapper: mapper)
    }
}
///Why do we need an extension for fetch in URLSession
extension URLSession {
    
    public func fetch(for request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let (data, response) = try await data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPError.invalidResponse(response: response)
        }
        return (data, httpResponse)
    }
}
