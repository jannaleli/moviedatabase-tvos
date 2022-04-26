//
//  MovieItem.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-30.
//

import SwiftUI

struct MovieItem: View {
    let imageName: String
    let imageSize: MovieItemSize
    let focused: Bool = false
    let movieType: MovieType
    
    var MovieItemSize: CGFloat {
        getSize()
    }
    
    var action: () -> Void
    
    private func getSize() -> CGFloat {
        switch imageSize {
            case .small: return 96
            case .medium: return 120
            case .large: return 400
        }
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

enum MovieItemSize {
    case small
    case medium
    case large
}

enum MovieType {
    case vod
    case dvr
}

struct MovieItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieItem(imageName: "epico", imageSize: .small, movieType: .dvr, action: {})
    }
}
