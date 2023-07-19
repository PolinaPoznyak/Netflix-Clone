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
    
    //TODO: make it private (private var apiClient: APIClient)
    var apiClient: APIClient
    private var account: Account?
    
    //MARK: - Init
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchTrendingMovies() {
//        apiClient.getPopularMovies() { result in
//            switch result {
//            case .success(let movies):
//                return(movies)
//            case .failure(_):
//                print("Failed to get popular movies")
//            }
//        }
    }
}
