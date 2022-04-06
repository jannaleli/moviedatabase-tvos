//
//  Dependency Provider.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-04.
//

import Foundation
import Swinject
final class DependencyProvider {
    
    let container = Container()
    let assembler: Assembler
    
    init() {
        assembler = Assembler(
            [AuthenticationAssembly()],
            container: container
        )
    }
    
}
