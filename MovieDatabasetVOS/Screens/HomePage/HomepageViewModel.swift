//
//  HomepageViewModel.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-21.
//

import Foundation
import Combine

protocol HomepageViewModel: ViewModel {
    var delegate: HomepageViewModelDelegate? { get set }
    var movies: [MovieData]  { get set }
    func fetchMovies() async
}

protocol HomepageViewModelDelegate: AnyObject {
    func didFetchMovies(result: APIMovieTMDB)
}

final class DefaultHomepageViewModel: ObservableObject, HomepageViewModel {
    
    weak var delegate: HomepageViewModelDelegate?
    
    private var movieSession: MovieSession
    
    @Published var movies: [MovieData] = []
    
    init(movieSession: MovieSession) {
        self.movieSession = movieSession
    }
    //TODO: Call this from view
    //But for now just print it
    @MainActor
    func fetchMovies() async {
        do {
            let response = try await movieSession.fetchMovies()
            print(response)
            movies = response.results
            print(movies)
          //  delegate?.didFetchMovies(result: response)
        } catch  {
            print(error)
        }
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
