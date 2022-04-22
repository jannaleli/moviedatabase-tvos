//
//  HomepageViewModel.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-21.
//

import Foundation
import Combine

protocol HomepageViewModel: ViewModel {
    func fetchMovies() async
}

final class DefaultHomepageViewModel: ObservableObject, HomepageViewModel {
    
    private var movieSession: MovieSession
    
    
    init(movieSession: MovieSession) {
        self.movieSession = movieSession
    }
    //TODO: Call this from view
    //But for now just print it
    func fetchMovies() async {
        
        
    }
    
    //TODO: Copy this below
    
//    @MainActor
//    private func fetchRegistrationStatus(pending: DeviceRegistrationCodePending) async {
//        do {
//            let response = try await userSession.fetchRegistrationStatus(registrationCode: pending.registrationCode)
//            switch response {
//            case .pending(let pending):
//                handle(pending: pending)
//            case .success:
//                delegate?.didActivate(self)
//            }
//        } catch {
//            toast.show(error: error)
//        }
//    }
    
    
}
