//
//  ActivationView_AreYouSignedIn.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-23.
//

import Foundation
import UIKit

protocol ActivationViewDelegate: AnyObject {
    func changeLanguage()
    func goToRegisterCode()
}

final class ActivationView: UIView {
    
    weak var delegate: ActivationViewDelegate?
    
    private lazy var stackView: UIStackView = makeStack()
    
    private lazy var changeLanguageButton: UIButton = makeButton(.changeLanguage)
    
    private lazy var continueButton: UIButton = makeButton(.continueButton)
    

    
    private lazy var textLabel: UILabel = makeTitleLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
        addAction()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
        addAction()
    }
    // MARK: - Private Methods

    private func setGeneralConfigurations() {
        let colorTop:UIColor =  .purple
        let colorBottom:UIColor = .systemBlue
        let gl = CAGradientLayer()
        gl.colors = [ colorTop, colorBottom]
        gl.locations = [ 0.0, 1.0]
        backgroundColor = .clear
        let backgroundLayer = gl
        backgroundLayer.frame = frame
        layer.insertSublayer(backgroundLayer, at: 0)
    }

    private func createSubviews() {
        addSubview(stackView)
    }

    private func setUpConstraints() {
        stackView.setSize(width: 400, height: 300)
        stackView.center(centerX: layoutMarginsGuide.centerXAnchor, centerY: layoutMarginsGuide.centerYAnchor)
        stackView.anchor(top: nil,
                         paddingTop: 10,
                         bottom: nil,
                         paddingBottom: 10,
                         left: layoutMarginsGuide.leadingAnchor,
                         paddingLeft: 5,
                         right: layoutMarginsGuide.trailingAnchor,
                         paddingRight: 2,
                         width: 0,
                         height: 0)
    }

    private func addAction() {
        continueButton.addAction(
            UIAction { _ in
                self.handleButtonToMainTapped()
            }, for: .touchDown
        )
    }

    // MARK: - Button Actions

    @objc func handleButtonToMainTapped() {
 
    }
     
}

extension ActivationView {
    
    func makeTitleLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.textColor = .systemBlue
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.kern: 2]
        titleLabel.attributedText = NSAttributedString(string: "Sample", attributes: attributes)
        titleLabel.textAlignment = .center

        titleLabel.font = UIFont(name: "Helvetica Neue", size: 30)

        return titleLabel
    }

    func makeStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [textLabel,
         changeLanguageButton,
         continueButton
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }
}
