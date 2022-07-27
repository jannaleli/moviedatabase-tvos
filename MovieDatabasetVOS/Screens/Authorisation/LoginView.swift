//
//  LoginView.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-12.
//

import SwiftUI
import Combine

struct LoginView: View {
    @Store var viewModel: LoginViewModel
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoading: Bool = false
    
    ///There should be an isLoading here that makes the entire view a loading progress view
    var body: some View {
        VStack {
                TextField("Username", text: $username)
                .frame(width: 500,  alignment: .center)
                SecureField("Password", text: $password)
                .frame(width: 500, alignment: .center)
            Button(action: { Task { await viewModel.loginUser() } }) {
                Text("Login")
            }
        }.opacity(isLoading ? 0.0 : 1.0)
        
        if(isLoading){
            ProgressView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: DefaultLoginViewModel(userSession: DefaultUserSession()))
    }
}
