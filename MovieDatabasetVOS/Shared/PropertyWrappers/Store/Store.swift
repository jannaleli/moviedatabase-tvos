//
//  Store.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-04.
//

import Foundation
import SwiftUI
import Combine

//MARK: Property wrapper so that any property wrapped in this property wrapper will become a Dynamic Property
@propertyWrapper
public struct Store<Model>: DynamicProperty {
    @dynamicMemberLookup
    public struct Wrapper {
        fileprivate var store: Store
        
        public subscript<Value>(dynamicMember keyPath: ReferenceWritableKeyPath<Model,Value>) -> Binding<Value> {
            Binding(
                get: { self.store.wrappedValue[keyPath: keyPath] },
                set: { self.store.wrappedValue[keyPath: keyPath] = $0 }
            )
        }
    }
    
    //MARK: Stored Properties
    
    public let wrappedValue: Model
    
    @ObservedObject
    private var observableObject: ErasedObservableObject
    
    //MARK: Computed Properties
    
    public var projectedValue: Wrapper {
        Wrapper(store: self)
    }
    
    public init (wrappedValue: Model) {
        self.wrappedValue = wrappedValue
        
        if let objectWillChange = (wrappedValue as? AnyObservableObject)?.objectWillChange {
            self.observableObject = .init(objectWillChange: objectWillChange.eraseToAnyPublisher())
        } else {
            assertionFailure("Only use the `Store` property wrapper with instances conforming to `AnyObservableObject`.")
            self.observableObject = .empty()
        }
    }
    
    //MARK: Methods
    
    public mutating func update() {
        _observableObject.update()
    }
}
