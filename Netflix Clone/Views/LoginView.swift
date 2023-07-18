//
//  LoginView.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 6.07.23.
//

import UIKit
import SnapKit

// MARK: - UI elements
class LoginView: UIView {
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "full-netflix-logo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .lightGray
        textField.backgroundColor = .darkGray
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: attributes)
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .lightGray
        textField.backgroundColor = .darkGray
        textField.isSecureTextEntry = true
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: attributes)
        
        return textField
    }()
    
    let showPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SHOW", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
        return button
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 10.0
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()

    private let guestModeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Guest Mode", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.addTarget(self, action: #selector(guestModeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    // MARK: - Setup
    private func setupSubviews() {
        backgroundColor = .black
        
        addSubview(logoImageView)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(guestModeButton)
        addSubview(showPasswordButton)
        
        // MARK: - Constraints
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(150)
        }

        usernameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(130)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
            make.height.equalTo(60)
        }

        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.leading.equalTo(usernameTextField.snp.leading)
            make.trailing.equalTo(usernameTextField.snp.trailing)
            make.height.equalTo(60)
        }

        showPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField.snp.centerY)
            make.trailing.equalTo(passwordTextField.snp.trailing).inset(10)
            make.height.equalTo(60)
        }

        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(showPasswordButton.snp.bottom).offset(50)
            make.leading.equalTo(passwordTextField.snp.leading)
            make.trailing.equalTo(passwordTextField.snp.trailing)
            make.height.equalTo(60)
        }

        guestModeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.leading.equalTo(loginButton.snp.leading)
            make.trailing.equalTo(loginButton.snp.trailing)
            make.height.equalTo(40)
        }
    }
    

    // MARK: - Actions
    var showPasswordButtonAction: (() -> Void)?
    var loginButtonAction: (() -> Void)?
    var guestModeButtonAction: (() -> Void)?

    @objc private func showPasswordButtonTapped() {
        showPasswordButtonAction?()
    }

    @objc private func loginButtonTapped() {
        loginButtonAction?()
    }

    @objc private func guestModeButtonTapped() {
        guestModeButtonAction?()
    }
}
