//
//  GenreMapper.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-21.
//

import Foundation

final class GenreMapper: HTTPResponseMapper {
    func map(data:Data, response: HTTPURLResponse) throws -> GenreList {
        switch response.statusCode {
        case 200, 201:
            print("genre success")
            return try data.decode()
        default:
            print("error")
            throw HTTPError.cannotDecodeRawData
        }
    }
}
