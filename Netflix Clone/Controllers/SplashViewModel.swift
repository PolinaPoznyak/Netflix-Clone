//
//  SplashViewModel.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 14.07.23.
//

import UIKit
import Foundation

class SplashViewModel {
    
    //MARK: - Properties
    
    weak var appCoordinator: AppCoordinator?
    weak var view: ViewController?
    
    //MARK: - Init
    
    init() {
    }
    
    //MARK: - Functions
    
    func goToLoginPage() {
        if let coordinator = appCoordinator {
            coordinator.presentLoginViewController()
        } else {
            print("SplashViewModel appCoordinator: \(String(describing: appCoordinator))")
        }
    }
}
