//
//  AppCoordinator.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 13.07.23.
//

import Foundation
import UIKit

class AppCoordinator {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator
    
    func start(){
        presentSplashViewController()
    }
    
    // MARK: -
    
    func presentSplashViewController() {
        let splashViewModel = SplashViewModel()
        splashViewModel.appCoordinator = self
        print("!!!appCoordinator splash: \(String(describing: splashViewModel.appCoordinator))")
        let splashViewController = ViewController(viewModel: splashViewModel)
        splashViewController.modalTransitionStyle = .crossDissolve
        splashViewController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(splashViewController, animated: false)
        print("present splash")
    }
    
    func presentLoginViewController() {
        let apiClient = APIClient()
        let loginViewModel = LoginViewModel(apiClient: apiClient)
        loginViewModel.appCoordinator = self
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        
        let navigationController = UINavigationController(rootViewController: loginViewController)
        navigationController.navigationBar.prefersLargeTitles = false
        
        loginViewController.modalTransitionStyle = .crossDissolve
        loginViewController.modalPresentationStyle = .fullScreen
        self.navigationController.present(navigationController, animated: true)
        
        print("present login")
    }
    
    func presentHomeViewController() {
        let homeViewController = HomeViewController()
        homeViewController.modalTransitionStyle = .crossDissolve
        homeViewController.modalPresentationStyle = .fullScreen
        navigationController.present(homeViewController, animated: true)
        print("present home")
    }
}
