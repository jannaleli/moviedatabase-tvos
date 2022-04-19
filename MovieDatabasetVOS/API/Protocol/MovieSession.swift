//
//  MovieSession.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-18.
//

import Foundation
import Combine
import Firebase

public protocol MovieSession {
    func getMovies() async 
}
