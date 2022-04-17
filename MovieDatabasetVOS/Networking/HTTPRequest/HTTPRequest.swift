//
//  HTTPRequest.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-07.
//

import Foundation

public struct HTTPRequest {
    let baseURL: URL
    let path: String
    let method: String
    let contentType: ContentType
    let parameters: [String: String]?
    let percentEncodedParameters: [String: String]?
    let formParameters: [String: String]?
    let headers: [String: String]?
    let body: Data?
    
    enum ContentType {
        case json
        case form
    }
}

extension HTTPRequest {
    public func toURLRequest() -> URLRequest? {
        try? URLRequest(request: self)
    }
}

// MARK: - Factory

extension URLRequest {
    
    init(request: HTTPRequest) throws {
        
        // path
        let baseURL = request.baseURL.appendingPathComponent(request.path)
        
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            throw HTTPError.invalidRequest(request: request)
        }
        
        // query
        if let parameters = request.parameters, !parameters.isEmpty {
            components.queryItems = parameters
                .map { .init(name: $0.key, value: $0.value) }
               // .sorted(by: \.name)
        }
        
        // percent encoded query
        if let percentEncodedParameters = request.percentEncodedParameters, !percentEncodedParameters.isEmpty {
            components.percentEncodedQueryItems = percentEncodedParameters
                .map { .init(name: $0.key, value: $0.value) }
               // .sorted(by: \.name)
        }
        
        guard let url = components.url else {
            throw HTTPError.invalidRequest(request: request)
        }
        
        var r = URLRequest(url: url)
        
        // method
        r.httpMethod = request.method
        
        // headers
        if let headers = request.headers, !headers.isEmpty {
            headers.forEach { r.setValue($0.value, forHTTPHeaderField: $0.key) }
        }
        
        // body
        switch request.contentType {
        case .json: r.httpBody = request.body
        case .form:
            if let formParameters = request.formParameters {
                let params = formParameters.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
                r.httpBody = params.data(using: String.Encoding.utf8)
            }
        }
        
        self = r
    }
}
