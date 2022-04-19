//
//  DefaultUserSession.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-07.
//

import Foundation
import Combine

public final class DefaultMovieSession {
    private let _sessionEndedPublisher = PassthroughSubject<Void, Error>()
    //This is just a private equivalent of the publicly available sessionEndedPublisher
    private var cancellable = Set<AnyCancellable>()
}

//MARK: - Movie Session

extension DefaultMovieSession: MovieSession {
    public func getMovies() async {
        let request = HTTPRequestBuilder(baseURL: <#T##URL#>)
    }
    
    
}
