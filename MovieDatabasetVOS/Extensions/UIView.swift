//
//  UIView.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-23.
//

import Foundation
import UIKit


enum ButtonType {
    case login
    case register
    case continueButton
    case changeLanguage
}

enum TextFieldType {
    case username
    case password
}



extension UIView {
    func makeButton(_ buttonType: ButtonType) -> UIButton {
        let button = UIButton()
        var config = button.getConfig()

        switch buttonType {
        case .login:
            config.title = "Login"
            config.baseBackgroundColor = .systemBlue
            config.cornerStyle = .large
            config.image = UIImage(systemName: "chevron.right")
            config.imagePadding = 5
            config.imagePlacement = .trailing
            break
        case .register:
            config.title = "Register"
            config.baseBackgroundColor = .systemBlue
            config.cornerStyle = .large
            config.image = UIImage(systemName: "chevron.right")
            config.imagePadding = 5
            config.imagePlacement = .trailing
            break
        case .continueButton:
            config.title = "Continue"
            config.baseBackgroundColor = .purple
            config.cornerStyle = .large
            break
        case .changeLanguage:
            config.title = "Change Language"
            config.baseBackgroundColor = .purple
            config.cornerStyle = .large
            break
        }

        button.setConfig(config: config)
        button.isUserInteractionEnabled = true

        return button
    }

    func makeTextField(_ textFieldType: TextFieldType) -> UITextField {
        let textField = UITextField()

        switch textFieldType {
        case .username:
            textField.placeholder = "Username"
            textField.autocapitalizationType = .none
        case .password:
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }

        textField.backgroundColor = .white
        textField.autocapitalizationType = .none
        textField.borderStyle = .roundedRect

        return textField
    }

    func findViewController() -> UIViewController? {
        if let nextResponder = next as? UIViewController {
            return nextResponder
        } else if let nextResponder = next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
