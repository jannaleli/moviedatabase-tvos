//
//  UserDefaultsBacked.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-04.
//

import Foundation

@propertyWrapper public struct UserDefaultsBacked<Value> {
    public var wrappedValue: Value {
        get {
            let value = storage.value(forKey: key) as? Value
            return value ?? defaultValue
        }
        set {
            storage.setValue(newValue, forKey: key)
        }
    }
    
    private let key: String
    private let defaultValue: Value
    private let storage: UserDefaults
    
    public init(wrapper defaultValue: Value,
                key:String,
                storage: UserDefaults = .standard) {
        self.defaultValue = defaultValue
        self.key = key
        self.storage = storage
    }
}
