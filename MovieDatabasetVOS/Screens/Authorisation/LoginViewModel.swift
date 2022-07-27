//
//  LoginViewModel.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-04-12.
//

import Foundation
import Combine
import CoreText
import Firebase


protocol LoginViewModel: ViewModel {
    var delegate: LoginViewModelDelegate? { get set }
    var isLoading: Bool { get set }
    var username: String { get set }
    var password: String { get set }
    func loginUser() async
}

protocol LoginViewModelDelegate: AnyObject {
    func didLogin(_ user: User)
}

final class DefaultLoginViewModel: ObservableObject, LoginViewModel {

    
    weak var delegate: LoginViewModelDelegate?
    private var bag = Set<AnyCancellable>()
    @Published var isLoading: Bool = false
    @Published var username: String = ""
    @Published var password: String = ""
    var cancellable = Set<AnyCancellable>()
    private var userSession: UserSession
    
    init(userSession: UserSession) {
        self.userSession = userSession
    }
        //TODO: For now, viewModel just goes directly to
    
    func success(user: User) {
        DispatchQueue.main.async {
            self.delegate?.didLogin(user)
        }
    }
    
    @MainActor
    func loginUser() async {
        print("Login now")
        isLoading = true
        
        do {
            try await userSession.login(username: "alelizaplan@gmail.com", password: "Abcd1234")
                .receive(on: DispatchQueue.global())
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(_): () 
                    case .finished: ()
                    }
                }, receiveValue: { [weak self] user  in
                    guard let self = self, let user = user else { return }
                    self.success(user: user)
                })
                .store(in: &cancellable)
            
       
        } catch {
           print("error")
            
            //TODO: - Put a toast message here
            ///Put a toast here to a display message in the meantime
        }
    }
    
    
}

extension DefaultLoginViewModel: LoginViewControllerDelegate {
    func loginCompleted() {
        
    }
}
