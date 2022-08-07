//
//  HTTPResponseMapper.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-07.
//

import Foundation

public protocol HTTPResponseMapper {
    associatedtype Output
    func map(data: Data, response: HTTPURLResponse) throws -> Output
}
