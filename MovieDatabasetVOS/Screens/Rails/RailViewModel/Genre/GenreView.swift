//
//  GenreView.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-29.
//

import SwiftUI
struct GenreView: View {
    @ObservedObject var viewModel: GenreViewModel
    @Namespace private var genreNamespace
    var body: some View {
        let _ = print("entered")
        let _ = print(viewModel.items)
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewModel.items) { item in
                    CardView(title: item.name,
                             action: {})
                }
            }
        }
        .padding(.leading, 300)
        .focusSection()
        .focusScope(genreNamespace)
    }
}
