//
//  DefaultUserSession.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-07.
//

import Foundation
import Combine

public final class DefaultMovieSession {
    let baseURL: String = APIConstants.BASE_URL ?? ""
    let apiKey = APIConstants.API_KEY ?? ""
    public var http: HTTPSession
    
    init(http: HTTPSession) {
        self.http = http
    }

    //TODO: UNWRAP SAFELY PLEASE
    
    // TODO: Place the base URL here.
    ///What can we do here 
}

extension DefaultMovieSession: MovieSession {
    public func fetchMovies() async throws -> APIMovieTMDB {
        //TODO: I think we can add another HTTPError right here
        guard let baseURL = URL(string: baseURL) else { throw HTTPError.invalidCodeResponse }
        print(apiKey)
        let request = HTTPRequestBuilder(baseURL: baseURL)
            .set(path: "discover/movie?api_key=\(apiKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate")
            .build()
        //TODO: Add a Movie Mapper here :) 
        return try await http.data(request: request, mapper: MovieMapper())
    }
    

    
    
    
}
