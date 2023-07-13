//
//  LoginViewController.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 6.07.23.
//

import SnapKit
import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    
    private let loginView = LoginView()
    private let loginViewModel: LoginViewModel

    
    //MARK: - Init
    
    init(viewModel: LoginViewModel) {
        self.loginViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.loginViewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(loginView)
        
        loginView.snp.makeConstraints {
            make in make.edges.equalToSuperview()
        }
        
        loginView.showPasswordButtonAction = { [weak self] in
            self?.showPasswordButtonTapped()
        }
        loginView.loginButtonAction = { [weak self] in
            self?.loginButtonTapped()
        }
        loginView.guestModeButtonAction = { [weak self] in
            self?.guestModeButtonTapped()
        }
    }
    
    // MARK: - Actions

    private func getUsername() -> String? {
        return loginView.usernameTextField.text
    }
    
    private func getPassword() -> String? {
        return loginView.passwordTextField.text
    }
    
    private func showPasswordButtonTapped() {
        loginViewModel.togglePasswordButtonVisibility()
    }
    
    private func loginButtonTapped() {
        guard let username = getUsername(), !username.isEmpty else {
            showAlert(message: "Please enter username")
            return
        }
        
        guard let password = getPassword(), !password.isEmpty else {
            showAlert(message: "Please enter password")
            return
        }
        
        loginViewModel.set(username: username)
        loginViewModel.set(password: password)
        loginViewModel.login(username: username, password: password)
    }
    
    private func guestModeButtonTapped() {
        print("guest")
    }
    
    //MARK: - Alert
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Update

    func updatePasswordTextField(isPasswordVisible: Bool) {
        loginView.passwordTextField.isSecureTextEntry = isPasswordVisible
        let showButtonTitle = isPasswordVisible ? "SHOW" : "HIDE"
        loginView.showPasswordButton.setTitle(showButtonTitle, for: .normal)
    }
}
