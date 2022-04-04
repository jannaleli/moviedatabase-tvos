//
//  ActivationViewController.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-23.
//

import Foundation
import UIKit
import SwiftUI

public protocol ActivationViewControllerDelegate: AnyObject {
    func changeLanguage()
    func goToRegisterCode()
}

final class ActivationViewController: UIViewController {
    // MARK: - Public Properties

    weak var delegate: ActivationViewControllerDelegate?
    
    private var authViewUI = UIHostingController(rootView: AuthViewSwiftUI())
    
    //var activationView = ActivationView()
    
    // MARK: - Override
    
    override func viewDidLoad() {
   
        super.viewDidLoad()
        addChild(authViewUI)
        authViewUI.view.frame = CGRect()
        view.addSubview(authViewUI.view)
        setUpConstraints()
    }

    override func loadView() {
       // activationView.delegate = self
       // view = activationView
    }
}

extension ActivationViewController: ActivationViewDelegate {
    func changeLanguage() {
        delegate?.changeLanguage()
    }
    
    func goToRegisterCode() {
        delegate?.goToRegisterCode()
    }
    
    
}

extension ActivationViewController {
    fileprivate func setUpConstraints() {
        authViewUI.view.translatesAutoresizingMaskIntoConstraints = false
        authViewUI.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        authViewUI.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive  = true
        authViewUI.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        authViewUI.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
