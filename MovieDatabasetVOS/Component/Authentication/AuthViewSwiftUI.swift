//
//  AuthViewSwiftUI.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-24.
//

import SwiftUI

struct AuthViewSwiftUI: View {
    var body: some View {

        VStack {
                                Button(action: {
                                          print("Right button is pressed")
                                      }) {
                                          Text("Continue")
            
            
                                      }
                                Button(action: {
                                          print("Right button is pressed")
                                      }) {
                                          Text("Continue")
            
            
                                      }

        }
    }
}

struct AuthViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        AuthViewSwiftUI()
    }
}
