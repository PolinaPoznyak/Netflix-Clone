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
        guard let email = loginView.emailTextField.text, let password = loginView.passwordTextField.text else {
            print("Please enter email and password")
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
                        print("Invalid email or password")
                    }
                    
                case .failure(_):
                    print("Failed to get account info")
                }
            }
        }
    }


    
    private func guestModeButtonTapped() {
        print("guest")
    }
}
