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
        let splashViewController = ViewController(viewModel: splashViewModel)
        splashViewController.modalTransitionStyle = .crossDissolve
        splashViewController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(splashViewController, animated: false)
    }
    
    func presentLoginViewController() {
        let apiClient = APIClient()
        
        let loginViewModel = LoginViewModel(apiClient: apiClient)
        loginViewModel.appCoordinator = self
        
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        
        let loginNavController = UINavigationController(rootViewController: loginViewController)
        loginNavController.navigationBar.prefersLargeTitles = false
        
        loginViewController.modalTransitionStyle = .crossDissolve
        loginViewController.modalPresentationStyle = .fullScreen
        self.navigationController.present(loginNavController, animated: true)
    }

    func presentHomeViewController() {
        let apiClient = APIClient()
        
        let homeViewModel = HomeViewModel(apiClient: apiClient)
        homeViewModel.appCoordinator = self
        
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        
        let homeNavController = UINavigationController(rootViewController: homeViewController)
        homeNavController.navigationBar.prefersLargeTitles = false
        
        homeViewController.modalTransitionStyle = .crossDissolve
        homeViewController.modalPresentationStyle = .fullScreen
        self.navigationController.dismiss(animated: true) {
            self.navigationController.present(homeNavController, animated: true)
        }
    }

    func presentMainTabBarController() {
        let apiClient = APIClient()
        
        let mainTabBarViewModel = MainTabBarViewModel(apiClient: apiClient)
        mainTabBarViewModel.appCoordinator = self
        
        let mainTabBarViewController = MainTabBarViewController(viewModel: mainTabBarViewModel)
        
        let mainTabBarNavController = UINavigationController(rootViewController: mainTabBarViewController)
        mainTabBarNavController.navigationBar.prefersLargeTitles = false
        
        mainTabBarViewController.modalTransitionStyle = .crossDissolve
        mainTabBarViewController.modalPresentationStyle = .fullScreen
        self.navigationController.dismiss(animated: true) {
            self.navigationController.present(mainTabBarNavController, animated: true)
        }
    }
}
