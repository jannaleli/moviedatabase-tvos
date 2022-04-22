//
//  JSONDecoder+Extension.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-21.
//

import Foundation

extension JSONDecoder {
    public func decode<T: Decodable>(_ data: Data) throws -> T {
        try decode(T.self, from: data)
    }
}

extension Data {
    public func decode<T: Decodable>(_ decoder: JSONDecoder = .init()) throws -> T {
        try decoder.decode(self)
    }
}


