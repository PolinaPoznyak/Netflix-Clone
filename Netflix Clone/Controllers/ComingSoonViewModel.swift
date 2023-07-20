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
    var apiClient: APIClient
    var movies: [Movie] = []
    
    //MARK: - Init
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    //MARK: - Functions
    
    func fetchComingSoon() {
        apiClient.getUpcomingMovies() { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                DispatchQueue.main.async { [weak self] in
                    self?.view?.comingView.collectionView.reloadData()
                }
            case .failure(_):
                print("Failed to get upcoming movies")
            }
        }
    }
}
