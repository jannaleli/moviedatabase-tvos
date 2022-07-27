//
//  MovieComponent.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-25.
//

import SwiftUI

struct MovieComponent: View {
    var imageUrl: String
    var movieName: String

    var body: some View {
    
            Button(action: { }) {
                VStack {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + imageUrl))
                        .frame(width: 500)
                    Text(movieName)
                        .shadow(radius: 20)
                }
            }.buttonStyle(ButtonMovieStyle())

        

    }
}

struct MovieComponent_Previews: PreviewProvider {
    static var previews: some View {
        MovieComponent(imageUrl: "https://example.com/icon.png",
                       movieName: "Turning Red")
    }
}
