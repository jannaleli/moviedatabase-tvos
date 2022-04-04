//
//  LoginView.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-23.
//

import Foundation
import UIKit

protocol LoginViewDelegate: AnyObject {
    func loginSelected()
}

class LoginView: UIView {
    weak var delegate: LoginViewDelegate?
    
   
}
