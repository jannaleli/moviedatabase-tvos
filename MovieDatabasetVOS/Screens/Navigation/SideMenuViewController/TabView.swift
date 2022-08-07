//
//  TabView.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-06-10.
//

import SwiftUI

struct TabUIView: View {
    @Store var viewModel: NavigationViewModel
    @Namespace private var namespace
    var body: some View {
        let _ = print("entered tab view")
        ZStack {
            HStack(spacing: 0) {
                makeMenu()
                    .background(.blue)
                Spacer()
            }
        }
        .ignoresSafeArea()
        .fillParent()

    }
    
    @ViewBuilder
    private func makeOverlay() -> some View {
        Color.black.opacity(0.1)
            .ignoresSafeArea()
            .fillParent()
    }
    
    @ViewBuilder
    private func makeMenu() -> some View {
            VStack(alignment: .leading) {
                Button("Movie") {
                    viewModel.isCollapsed = true
                }
                Button("Genre") {
                    viewModel.isCollapsed = true
                    viewModel.showGenre()
                }
            }
            .fillHeight()
            .frame(width: 400,alignment: .top)
        

    }
}

