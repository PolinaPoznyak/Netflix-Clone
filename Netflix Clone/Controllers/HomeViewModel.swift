//
//  HomeViewModel.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 17.07.23.
//

import UIKit
import Foundation

class HomeViewModel {
    
    //MARK: - Properties
    
    weak var appCoordinator: AppCoordinator?
    weak var view: HomeViewController?
    
    private var apiClient: APIClient
    private var account: Account?
    
    //MARK: - Init
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}
