//
//  HTTPRequestBuilder.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-19.
//

import Foundation

public final class HTTPRequestBuilder {
    private var baseURL: URL
    private var path: String
    private var method: String = "GET"
    private var contentType: HTTPRequest.ContentType = .json
    private var parameters: [String: String]  = .init()
    private var percentEncodedParameters: [String: String] = .init()
    private var formParameters: [String: String] = .init()
    private var headers: [String: String] = .init()
    private var body: Data?
    
    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    public func set(baseURL: URL) -> Self {
        self.baseURL = baseURL
        return self
    }
    
    public func set(path: String) -> Self {
        self.path = path
        return self
    }
    
    public func append(path: String) -> Self {
        self.path = self.path.appending(path)
    }
    
    public func set(method: String) -> Self {
        self.method = method
        return self
    }
    
    public func addParameter(name: String, value: String?) -> Self {
        self.parameters[name] = value
    }
    
    public func addPercentEncodedParameter(name: String, value: String) -> Self {
        self.percentEncodedParameters[name] = value
        return self
    }
    
    public func addFormParameter(name: String, value: String) -> Self {
        self.formParameters[name] = value
        return self
    }
    
    public func addHeader(name: String, value: String) -> Self {
        self.headers[name] = value
        return self
    }
    
    public func set(body: Data) -> Self {
        self.body = body
        return self
    }
    
    public func build() -> HTTPRequest {
        .init(
            baseURL: baseURL,
            path: path,
            method: method,
            contentType: contentType,
            parameters: parameters,
            percentEncodedParameters: percentEncodedParameters,
            formParameters: formParameters,
            headers: headers,
            body: body
        )    }
}

//MARK: -Convenience

extension HTTPRequestBuilder {
    public func setAcceptJSON() -> Self {
        contentType = .json
        return addHeader(name: "Content-Type", value: "application/json")
    }
    
    public func setAcceptFormData() -> Self {
        contentType = .form
        return addHeader(name: "Content-Type", value: "application/x-www-form-urlencoded")
    }
    
    public func set(JSONBody: Any) -> Self {
        body = try? JSONSerialization.data(withJSONObject: JSONBody, options: .prettyPrinted)
        
        return setAcceptJSON()
    }
    
    public func set<T: Encodable>(JSONBody: T) -> Self {
        body = try? JSONEncoder().encode(JSONBody)
        return setAcceptJSON()
    }
}
