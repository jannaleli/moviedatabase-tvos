//
//  DefaultUserSession.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-13.
//

import Foundation
import Combine
import Firebase


public final class DefaultUserSession {
    private let _sessionEndedPublisher = PassthroughSubject<Void, Error>()
    //This is just a private equivalent of the publicly available sessionEndedPublisher
    private var cancellable = Set<AnyCancellable>()

}

//MARK: - User Session

extension DefaultUserSession: UserSession {
    public var isAuthenticated: Bool {
        false
    }
    ///{
    ///storage.authToken != nil
    ///}
    ///But since we're looking at a simple login/authentication process, we will just use bool for this one.
    public var sessionEndedPublisher: AnyPublisher<Void, Error> {
        _sessionEndedPublisher.eraseToAnyPublisher()
    }
    
    
    
    public func login(username: String, password: String) -> Future<User?, Error>  {
        return Future<User?, Error> { promise in

            Auth.auth().signIn(withEmail: username, password: password, completion: {
                result, error in

                if let e = error {
                    // TODO: Place an error completion block in here
                    print(e)
                    return promise(.failure(e))

                } else if let user = result?.user {
                    print(user)
                    return promise(.success(user))
                }

            })
        }
    }
}
