//
//  RailView.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-28.
//

import SwiftUI

struct RailView: View {
    @Store var viewModel: RailViewModel
    var body: some View {
        let _ = print("entered rail view")
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                let _ = print(viewModel.isReady)
                if viewModel.isReady {
                    
                    ForEach(viewModel.railsTransformed) { item in
                        makeSwimlane(type:  item)
                    }
                    
                }else {
                    ProgressView()
                }
            }

        }.task {
            await viewModel.prepare()
        }
    }
    
    @ViewBuilder
    private func makeSwimlane(type: RailType) -> some View {
        switch type {
        case .genre (let vm):
            GenreView(viewModel: vm)
        case .movie (let vm):
            MovieView(viewModel: vm)
        }
    }
}

