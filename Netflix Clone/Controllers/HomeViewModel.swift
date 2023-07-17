//
//  HomeViewModel.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 17.07.23.
//

import UIKit
import Foundation

class HomeViewModel {
    
    var appCoordinator: AppCoordinator?
    
    weak var view: LoginViewController?
    
    private var apiClient: APIClient
    private var account: Account?
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}
