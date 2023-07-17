//
//  SplashViewModel.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 14.07.23.
//

import UIKit
import Foundation

class SplashViewModel {
    
    weak var appCoordinator: AppCoordinator? {
        didSet {
            print("splash L")
        }
    }
    
    weak var view: ViewController?
    
    init() {
        print("init splash")
    }
    
    func goToLoginPage() {
            if let coordinator = appCoordinator {
                coordinator.presentLoginViewController()
            } else {
                print("!!!appCoordinator svm: \(String(describing: appCoordinator))")
            }
        }
}
