//
//  LoginViewController.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 6.07.23.
//

import SnapKit
import UIKit

class LoginViewController: UIViewController {
    private let loginView = LoginView()
    
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

    private func showPasswordButtonTapped() {
        loginView.passwordTextField.isSecureTextEntry.toggle()
        let showButtonTitle = loginView.passwordTextField.isSecureTextEntry ? "SHOW" : "HIDE"
        loginView.showPasswordButton.setTitle(showButtonTitle, for: .normal)
    }
    
    private func loginButtonTapped() {
        guard let email = loginView.emailTextField.text, !email.isEmpty,
                 let password = loginView.passwordTextField.text, !password.isEmpty else {
               showAlert(message: "Please enter email and password")
               return
           }
        
        if email.isEmpty {
            showAlert(message: "Please enter email")
            return
        }
        
        if password.isEmpty {
            showAlert(message: "Please enter password")
            return
        }
        
        APIClient.shared.getAccountInfo { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let account):
                    let currentAccount = Account(id: account.id, name: account.name, username: account.username)
                    
                    if email == currentAccount.username && password == "Pa$$word" {
                        let homeViewController = HomeViewController()
                        homeViewController.modalPresentationStyle = .currentContext
                        self?.present(homeViewController, animated: true)
                    } else {
                        self?.showAlert(message: "Invalid email or password")
                    }
                    
                case .failure(_):
                    self?.showAlert(message: "Failed to get account info")
                }
            }
        }
    }
    
    private func guestModeButtonTapped() {
        print("guest")
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
