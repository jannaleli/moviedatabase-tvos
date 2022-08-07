//
//  Resolver+Assembler.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-12.
//

import Foundation
import Swinject

extension Resolver {
    func resolve<Service>() -> Service {
        resolve(Service.self)!
    }
    
    func resolve<Service, Arg1>(argument: Arg1) -> Service {
        resolve(Service.self, argument: argument)!
    }
    
}

extension Assembler {
    var container: Container? {
        resolver as? Container
    }
    
    func resolve<Service>() -> Service {
        resolver.resolve(Service.self)!
    }
    
    func resolve<Service, Arg1>(argument: Arg1) -> Service {
        resolver.resolve(Service.self, argument: argument)!
    }
}
