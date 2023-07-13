//
//  LoginViewModelProtocol.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 12.07.23.
//

import UIKit

protocol LoginViewModelProtocol {
    func set(username: String)
    func set(password: String)
    func login(username: String, password: String)
    func togglePasswordButtonVisibility()
}
