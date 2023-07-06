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
        
        // Добавляем loginView в иерархию представлений контроллера
        view.addSubview(loginView)
        
        loginView.snp.makeConstraints {
            make in make.edges.equalToSuperview()
        }
    }
}
