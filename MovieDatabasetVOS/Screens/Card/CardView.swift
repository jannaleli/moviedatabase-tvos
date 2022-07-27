//
//  CardView.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-21.
//

import SwiftUI

struct CardView: View {
    var image: String?  //TODO: maybe a fallback image is sufficient too?
    var title: String
    var radius: CGFloat = 8
    var borderWidt: CGFloat = 8
    var imagePadding: EdgeInsets = .init(top: 30, leading: 30, bottom: 30, trailing: 30)
    var type: CardType = .regular

    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            ZStack {
                if let image = image {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + image))
                        .padding(imagePadding)
                } else {
                    Text(title)
                        .shadow(radius: 20)
                }
            }
            .overlay(makeBorder())
            .frame(size: type.size)

        }
        .focusable(true)
        .focused($isFocused)
    }
    
    @ViewBuilder
    private func makeBorder() -> some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(
                isFocused ? .green : .clear,
                lineWidth: borderWidt
            )
            .padding(borderWidt/2)
            .animation(.easeOut(duration: 0.15), value: isFocused)
    }
}

