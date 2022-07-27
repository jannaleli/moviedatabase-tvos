//
//  RailViewModel.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-26.
//

import Foundation

protocol RailViewModel: ViewModel {
    var isReady: Bool { get }
    var rails: [String] { get }
    var railsTransformed: [RailType] { get }
    func prepare() async
    func handle(_ action: NavigationAction)
}

final class DefaultRailViewModel: ObservableObject, RailViewModel {
    var railsTransformed: [RailType]
    @Published var isReady: Bool = false
    var rails: [String] = ["movie", "genre"]
    
    init(factory: RailFactory, tabId: String) {
        print("Entered RailViewModel")
        rails = [tabId]

        railsTransformed = rails.compactMap(factory.makeViewModel(rail:))
    }

    @MainActor
    func prepare() async {
        print("prepare was called from railviewmodel")
        // TODO: How to populate rail haha!
        do {
            _ = try await railsTransformed.concurrentMap {
                try await $0.prepare()
            }
            print("isReady will be true")
            isReady = true
        } catch {
            //error
            //put a toast here later
        }
    }
    
    func handle(_ action: NavigationAction) {
        
    }
    
    
}
