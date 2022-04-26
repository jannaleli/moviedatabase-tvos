//
//  HomepageViewControlelr.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-21.
//

import Foundation
import SwiftUI

//TODO: Go do this in Coordinator
public protocol HomepageViewControllerDelegate: AnyObject {
    func moviesLoaded()
}

final class HomepageViewController: UIHostingController<HomepageView> {
    
    weak var delegate: HomepageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.viewModel.delegate = self
    }
}

extension HomepageViewController: HomepageViewModelDelegate  {
 
    
    func didFetchMovies(result: APIMovieTMDB) {
        delegate?.moviesLoaded()
    }
}
