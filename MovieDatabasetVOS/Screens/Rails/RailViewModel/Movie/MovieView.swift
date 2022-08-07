//
//  MovieView.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-29.
//

import SwiftUI
struct MovieView: View {
    @ObservedObject var viewModel: MovieViewModel
    @Namespace private var mainNamespace
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewModel.items) { item in
                    CardView(image: item.poster_path,
                             title: item.original_title,
                             action: { Task { try await viewModel.handle(movieId: item.id.codingKey.stringValue) }
                    })
                }
            }

        }
        .padding(.leading, 300)
        .focusSection()
        .focusScope(mainNamespace)
    }
}
