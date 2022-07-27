//
//  RailAssembly.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-28.
//

import Foundation
import Swinject
import SwinjectAutoregistration

struct RailArguments {
    let tabId: String
    let handler: NavigationActionHandler
}

final class SwimlanePageAssembly: Assembly {
    func assemble(container: Container) {
        
        container.autoregister(RailFactory.self, initializer: DefaultRailFactory.init)
        
        container.register(RailViewModel.self) { ( r: Resolver, args: RailArguments) in
            DefaultRailViewModel(factory: r.resolve(),
                                 tabId: args.tabId)
            
        }
        
        container.register(RailView.self) { (r: Resolver, args: RailArguments) in
            RailView(viewModel: r.resolve(argument: args))
        }
        
        container.register(RailViewController.self) { (r: Resolver, args: RailArguments) in
            RailViewController(rootView: r.resolve(argument: args))
            
        }
    

    }
}
