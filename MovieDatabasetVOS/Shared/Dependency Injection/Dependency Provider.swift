//
//  Dependency Provider.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-04.
//

import Foundation
import Swinject
import SwinjectAutoregistration
final class DependencyProvider {
    
    let container = Container()
    let assembler: Assembler
    
    init() {
        assembler = Assembler(
            [LoginAssembly(),
             NetworkAssembly()],
            container: container
        )
    }
    
}
