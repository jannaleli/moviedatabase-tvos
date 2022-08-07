//
//  ErrorViewModel.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-30.
//

import Foundation


struct Alert {
    let title: String?
    let subTitle: String?
}

protocol ErrorViewModel: ViewModel {
    var showAlert: Bool { get set }
    var alert: Alert { get }
    var showSpinner: Bool { get set }
    func showAlert(title: String?, subTitle: String?)
    func showError(error: Error)
    func startSpinner()
    func stopSpinner()
}

final class DefaultErrorViewModel: ObservableObject, ErrorViewModel {
    
    // MARK: Alert
    
    @Published var showAlert = false
    @Published var alert = Alert(title: nil, subTitle: nil) {
        didSet {
            showAlert.toggle()
        }
    }
    
    // MARK: Spinner
    
    @Published var showSpinner = false
    
    // MARK: Private Properties
    
    private var spinnerCount = 0 {
        didSet {
            showSpinner = spinnerCount > 0
        }
    }
    
    // MARK: Internal
    
    func showAlert(title: String? = nil, subTitle: String? = nil) {
        alert = Alert(title: title, subTitle: subTitle)
    }
    
    func showError(error: Error) {
        guard !showAlert else { return }
        alert = Alert(title: "Oops!", subTitle: error.localizedDescription)
    }
    
    func startSpinner() {
        spinnerCount += 1
    }
    
    func stopSpinner() {
        spinnerCount -= 1
    }
}

