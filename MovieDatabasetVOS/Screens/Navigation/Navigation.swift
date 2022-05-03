//
//  Navigation.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-28.
//

import SwiftUI

struct Navigation: View {
    
    @Store var viewModel: HomepageViewModel
    var body: some View {
        TabView {
            HomepageView(viewModel: viewModel).tabItem {
                Text("Movies")
            }
            
            HomepageView(viewModel: viewModel).tabItem {
                Text("Show")
            }
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation(viewModel: MockHomepageViewModel())
    }
}
