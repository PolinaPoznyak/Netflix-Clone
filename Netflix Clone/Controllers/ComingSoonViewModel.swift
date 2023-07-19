//
//  ComingSoonViewModel.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 18.07.23.
//

import Foundation

class ComingSoonViewModel {
    
    //MARK: - Properties
    
    weak var appCoordinator: AppCoordinator?
    weak var view: ComingSoonViewController?
    
    private var apiClient: APIClient
    private var account: Account?
    
    //MARK: - Init
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}
