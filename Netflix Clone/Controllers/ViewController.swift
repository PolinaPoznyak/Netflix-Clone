//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 26.06.23.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}
   
// MARK: - Private method
private extension ViewController {
    func initialize() {
        view.backgroundColor = .black
        
        let splashView = SplashView()
        view.addSubview(splashView)
        
        splashView.snp.makeConstraints {
            make in make.edges.equalToSuperview()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
            let apiClient = APIClient()
            let loginViewModel = LoginViewModel(apiClient: apiClient)
            let loginViewController = LoginViewController(viewModel: loginViewModel)
            loginViewController.modalTransitionStyle = .crossDissolve
            loginViewController.modalPresentationStyle = .fullScreen
            self?.present(loginViewController, animated: true, completion: nil)
        }
    }
}
