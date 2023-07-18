//
//  MainTabBarViewModel.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 18.07.23.
//

import Foundation
import UIKit

class MainTabBarViewModel {
    
    //MARK: - Properties
    
    weak var appCoordinator: AppCoordinator?
    weak var view: MainTabBarViewController?
    
    private var apiClient: APIClient
    private var account: Account?
    
    //MARK: - Init
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    // MARK: - Functions
//    
//    func goToHomePage() {
//        appCoordinator?.presentHomeViewController()
//    }
}
