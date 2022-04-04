//
//  ErasedObservableObject.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-04.
//

import Combine

class ErasedObservableObject: ObservableObject {
    let objectWillChange: AnyPublisher<Void, Never>
    
    init(objectWillChange: AnyPublisher<Void, Never>) {
        self.objectWillChange = objectWillChange
    }
    static func empty() -> ErasedObservableObject {
        .init(objectWillChange: Empty().eraseToAnyPublisher())
    }
}
