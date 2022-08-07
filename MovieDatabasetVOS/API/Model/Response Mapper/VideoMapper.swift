//
//  VideoMapper.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-31.
//

import Foundation

final class VideoMapper: HTTPResponseMapper {
    func map(data:Data, response: HTTPURLResponse) throws -> APIVideoTMDB {
        switch response.statusCode {
        case 200, 201:
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                print(json)
               }catch{ print("erroMsg") }

            return try data.decode()
        default:
            print("error")
            throw HTTPError.cannotDecodeRawData
        }
    }
}
