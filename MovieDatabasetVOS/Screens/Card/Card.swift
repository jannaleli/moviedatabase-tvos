//
//  Card.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-21.
//

import SwiftUI

struct Card: View {
    var viewModel: CardViewModel
    var type: CardType = .regular
    var action: (NavigationAction) -> Void
    
    var body: some View {
        Button(action: { action(viewModel.action) }) {
            CardView(
                image: viewModel.image ?? "",
                title: viewModel.title,
                type: type,
                action: {}
            )
        }
        .buttonStyle(.card)
    }
}


