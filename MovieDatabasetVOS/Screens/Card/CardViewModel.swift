//
//  CardViewModel.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-21.
//

import Foundation

struct CardViewModel: Identifiable, Hashable {
    let id: String
    let image: String?
    let title: String
    let action: NavigationAction
}
