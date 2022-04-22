//
//  MovieMapper.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-21.
//

import Foundation

final class MovieMapper: HTTPResponseMapper {
    func map(data: Data, response: HTTPURLResponse) throws -> APIMovieTMDB {
        switch response.statusCode {
        case 200, 201:
            return try data.decode(JSONDecoder())
        default:
            throw HTTPError.cannotDecodeRawData
        }
    }
}
