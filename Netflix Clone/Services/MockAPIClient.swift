//
//  MockAPIClient.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 7.07.23.
//

import Foundation

class MockAPIClient: APIClientProtocol {
    
    let shared = MockAPIClient()
    
    func getPopularMovies(_ completion: @escaping (Result<[Movie], NetworkError>) -> ()) {
        
    }
    
    func createRequestToken(_ completion: @escaping (Result<AuthenticationTokenResponse, NetworkError>) -> ()) {
    }
    
    func getAccountInfo(_ completion: @escaping (Result<Account, NetworkError>) -> ()) {
        
    }
}
