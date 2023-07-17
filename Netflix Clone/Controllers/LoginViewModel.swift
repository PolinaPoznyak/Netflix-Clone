//
//  LoginViewModel.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 11.07.23.
//

import UIKit
import Foundation

class LoginViewModel: LoginViewModelProtocol {

    weak var appCoordinator: AppCoordinator? {
        didSet {
            print("login L")
        }
    }
    weak var view: LoginViewController?

    private var apiClient: APIClient
    private var account: Account?
    private var isPasswordVisible: Bool = false

    var authUsername: String
    var authPassword: String

    init(apiClient: APIClient) {
        self.apiClient = apiClient
        self.authUsername = ""
        self.authPassword = ""
    }
    
    func goToHomePage() {
        appCoordinator?.presentHomeViewController()
    }

    func set(username: String) {
        authUsername = username
    }

    func set(password: String) {
        authPassword = password
    }

    func login(username: String, password: String) {
        apiClient.getAccountInfo { [weak self, view] result in
            switch result {
            case .success(let account):
                self?.account = Account(id: account.id, name: account.name, username: account.username)
                if username == account.username && password == "Pa$$word" {
                    DispatchQueue.main.async {
                        self?.goToHomePage()
                        view?.showAlert(message: "Successful login")
                    }
                } else {
                    view?.showAlert(message: "Invalid email or password")
                }
            case .failure(_):
                view?.showAlert(message: "Failed to get account info")
            }
        }
    }

    func togglePasswordButtonVisibility() {
        isPasswordVisible.toggle()
        view?.updatePasswordTextField(isPasswordVisible: !isPasswordVisible)
    }
}

