//
//  AnyObservableObject.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-04.
//

import Foundation
import Combine


public protocol AnyObservableObject: AnyObject {
    var objectWillChange: ObservableObjectPublisher { get }
}
