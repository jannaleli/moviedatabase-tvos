//
//  HomepageView.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-30.
//

import SwiftUI

struct HomepageView: View {
    @Store var viewModel: HomepageViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).task {
            
            await viewModel.fetchMovies()
        }
    }
}

//struct HomepageView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomepageView(viewModel: DefaultHomepageViewModel(movieSession: DefaultMovieSession()))
//    }
//}
