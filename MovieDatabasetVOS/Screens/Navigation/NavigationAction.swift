//
//  NavigationAction.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-21.
//

import Foundation

enum NavigationAction: Hashable {
    case show(String)
    case movies(String)
    case genre(String)
    case play(String) // Presumably the video link that we will embed in the player
    case unknown
}

protocol NavigationActionHandler: AnyObject {
    func handle(_ action: NavigationAction)
}
