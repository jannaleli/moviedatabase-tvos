
//
//  NavigationViewModel.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-06-02.
//

import Foundation
import Combine

protocol NavigationViewModelDelegate: AnyObject {
    func didSelectItem(_ sender: NavigationViewModel, item: String)
}

protocol NavigationViewModel: ViewModel {
    var delegate: NavigationViewModelDelegate? { get set }
    var isCollapsed: Bool { get set }
    var isCollapsedPublisher: AnyPublisher<Void, Never> { get }
    func showGenre()
}

final class DefaultNavigationViewModel: ObservableObject, NavigationViewModel {
    
    weak var delegate: NavigationViewModelDelegate?
    func showGenre() {
        delegate?.didSelectItem(self, item: "genre")
        
    }
    
    @Published var isCollapsed: Bool = true

    var isCollapsedPublisher: AnyPublisher<Void, Never> {
        $isCollapsed.discardOutput().eraseToAnyPublisher()
    }

    
}

extension Publisher {
    
    public typealias PublisherResult = Result<Self.Output, Self.Failure>
    public typealias PublisherResultCompletion = (PublisherResult) -> Void
    
    public func result(_ completion: @escaping PublisherResultCompletion) -> AnyCancellable {
        sink(
            receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    completion(.failure(error))
                case .finished:
                    break
                }
            },
            receiveValue: {
                completion(.success($0))
            }
        )
    }

    public func discardOutput() -> AnyPublisher<Void, Failure> {
        map { _ in () }.eraseToAnyPublisher()
    }
    
    public func receiveOnMain() -> AnyPublisher<Output, Failure> {
        receive(on: RunLoop.main).eraseToAnyPublisher()
    }
}
