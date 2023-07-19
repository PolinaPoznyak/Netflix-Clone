//
//  APIClient.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 6.07.23.
//

import Foundation

protocol APIClientProtocol {
    func getPopularMovies(_ completion: @escaping (Result<[Movie], NetworkError>) -> ())
    func createRequestToken(_ completion: @escaping (Result<AuthenticationTokenResponse, NetworkError>) -> ())
    func getAccountInfo(_ completion: @escaping (Result<Account, NetworkError>) -> ())
}

struct APIClient: APIClientProtocol {
    static let shared = APIClient()
    private let session = URLSession(configuration: .default)

    func getPopularMovies(_ completion: @escaping (Result<[Movie], NetworkError>) -> ()) {
        do{
            let parameters = [
                "sort_by": "popularity.desc"
            ]
          // Creating the request
            let request = try Request.configureRequest(from: .movies, with: parameters, and: .get, contains: nil)
                session.dataTask(with: request) { (data, response, error) in

                if let response = response as? HTTPURLResponse, let data = data {

                    let result = Response.handleResponse(for: response)
                    switch result {
                    case .success:
                        //Decode if successful
                        let result = try? JSONDecoder().decode(MovieApiResponse.self, from: data)
                        completion(Result.success(result!.movies))

                    case .failure:
                        completion(Result.failure(NetworkError.decodingFailed))
                    }
                }
            }.resume()
        }catch{
            completion(Result.failure(NetworkError.badRequest))
        }
    }
    
    func getTrendingMovies(_ completion: @escaping (Result<[Movie], NetworkError>) -> ()) {
        do{
            let parameters = [
                "sort_by": "vote_count.desc",
                "with_genres": "10749"
            ]
          // Creating the request
            let request = try Request.configureRequest(from: .trendingMovies, with: parameters, and: .get, contains: nil)
                session.dataTask(with: request) { (data, response, error) in

                if let response = response as? HTTPURLResponse, let data = data {

                    let result = Response.handleResponse(for: response)
                    switch result {
                    case .success:
                        //Decode if successful
                        let result = try? JSONDecoder().decode(MovieApiResponse.self, from: data)
                        completion(Result.success(result!.movies))

                    case .failure:
                        completion(Result.failure(NetworkError.decodingFailed))
                    }
                }
            }.resume()
        }catch{
            completion(Result.failure(NetworkError.badRequest))
        }
    }
    
    func getTrendingСartoons(_ completion: @escaping (Result<[Movie], NetworkError>) -> ()) {
        do{
            let parameters = [
                "sort_by": "popularity.desc",
                "with_genres": "16"
            ]
            let request = try Request.configureRequest(from: .trendingCartoons, with: parameters, and: .get, contains: nil)
                session.dataTask(with: request) { (data, response, error) in

                if let response = response as? HTTPURLResponse, let data = data {

                    let result = Response.handleResponse(for: response)
                    switch result {
                    case .success:
                        let result = try? JSONDecoder().decode(MovieApiResponse.self, from: data)
                        completion(Result.success(result!.movies))

                    case .failure:
                        completion(Result.failure(NetworkError.decodingFailed))
                    }
                }
            }.resume()
        }catch{
            completion(Result.failure(NetworkError.badRequest))
        }
    }
    
    func getUpcomingMovies(_ completion: @escaping (Result<[Movie], NetworkError>) -> ()) {
        do{
            let parameters = [
                "sort_by": "release_date.asc"
            ]
            let request = try Request.configureRequest(from: .upcomingMovies, with: parameters, and: .get, contains: nil)
                session.dataTask(with: request) { (data, response, error) in

                if let response = response as? HTTPURLResponse, let data = data {

                    let result = Response.handleResponse(for: response)
                    switch result {
                    case .success:
                        //Decode if successful
                        let result = try? JSONDecoder().decode(MovieApiResponse.self, from: data)
                        completion(Result.success(result!.movies))

                    case .failure:
                        completion(Result.failure(NetworkError.decodingFailed))
                    }
                }
            }.resume()
        }catch{
            completion(Result.failure(NetworkError.badRequest))
        }
    }
    
    func getRatedMovies(_ completion: @escaping (Result<[Movie], NetworkError>) -> ()) {
        do{
            let parameters = [
                "vote_average": "vote_average.desc"
            ]
            let request = try Request.configureRequest(from: .ratedMovies, with: parameters, and: .get, contains: nil)
                session.dataTask(with: request) { (data, response, error) in

                if let response = response as? HTTPURLResponse, let data = data {

                    let result = Response.handleResponse(for: response)
                    switch result {
                    case .success:
                        //Decode if successful
                        let result = try? JSONDecoder().decode(MovieApiResponse.self, from: data)
                        completion(Result.success(result!.movies))

                    case .failure:
                        completion(Result.failure(NetworkError.decodingFailed))
                    }
                }
            }.resume()
        }catch{
            completion(Result.failure(NetworkError.badRequest))
        }
    }
    
    func createRequestToken(_ completion: @escaping (Result<AuthenticationTokenResponse, NetworkError>) -> ()) {
        do{
            let request = try Request.configureRequest(from: .token, with: [:], and: .get, contains: nil)
            session.dataTask(with: request) { (data, response, error) in

              if let response = response as? HTTPURLResponse, let data = data {
                  let result = Response.handleResponse(for: response)
                  switch result {
                  case .success:
                      let result = try? JSONDecoder().decode(AuthenticationTokenResponse.self, from: data)
                      completion(Result.success(result!))
                      print(result)

                  case .failure:
                      completion(Result.failure(NetworkError.decodingFailed))
                  }
              }
            }.resume()
        }catch{
            completion(Result.failure(NetworkError.badRequest))
        }
    }
    
    func getAccountInfo(_ completion: @escaping (Result<Account, NetworkError>) -> ()) {
        do{
            let request = try Request.configureRequest(from: .account, with: [:], and: .get, contains: nil)
            session.dataTask(with: request) { (data, response, error) in

              if let response = response as? HTTPURLResponse, let data = data {
                  let result = Response.handleResponse(for: response)
                  switch result {
                  case .success:
                      let result = try? JSONDecoder().decode(Account.self, from: data)
                      completion(Result.success(result!))
                      print(result)

                  case .failure:
                      completion(Result.failure(NetworkError.decodingFailed))
                  }
              }
            }.resume()
        }catch{
            completion(Result.failure(NetworkError.badRequest))
        }
    }
}
