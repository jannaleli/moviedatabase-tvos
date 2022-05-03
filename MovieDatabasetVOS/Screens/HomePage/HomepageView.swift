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
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewModel.movies) { profile in
                    MovieComponent(imageUrl: profile.poster_path,
                                       movieName: profile.original_title)
                }
            }

        }.task {
            await viewModel.fetchMovies()
        }
    }
}

//struct HomepageView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomepageView(viewModel: DefaultHomepageViewModel(movieSession: DefaultMovieSession()))
//    }
//}

//    ScrollView(.horizontal, showsIndicators: false) {
//        LazyHStack(alignment: .top, spacing: 60) {
//            ForEach(viewModel.profiles) { profile in
//                ProfileItem(
//                    profile: profile,
//                    action: { viewModel.select(profile: profile) },
//                    editAction: { viewModel.editProfile(profileId: profile.id) }
//                )
//            }
//            if viewModel.isCreateProfileEnabled {
//                ButtonTVFancy(
//                    icon: .add,
//                    type: .primary,
//                    background: .varied,
//                    action: viewModel.createProfile
//                )
//                .padding(.leading, 24)
//                .padding(.top, 168)
//            }
//        }
//        .frame(height: 370)
//        .padding(.leading, 120)
//        .padding(.trailing, 120)
//    }
