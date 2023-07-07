//
//  Request.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 6.07.23.
//

import Foundation

public enum HTTPMethod: String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum Route: String{
    case movies = "discover/movie"
    case token = "authentication/token/new"
    case session = "authentication/session/new"
    case account = "account"
}

struct Request {
    
    static let headers = [
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ODk4NjI5NzhjYWViZGNjMDM3NWMwZTJlN2U2ZjMyNCIsInN1YiI6IjY0YTQ0MDhlOGUyMGM1MDBlYzNkNWY3MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gibTl86NAOQ7PWkxK5OyTQ03R7JdDwsOgBgZifIaqPA"
    ]
    
    static func configureRequest(from route: Route, with parameters: [String: Any], and method: HTTPMethod, contains body: Data?) throws -> URLRequest {

        // safely unwrap URL or return error
        guard let url = URL(string: "https://api.themoviedb.org/3/\(route.rawValue)") else { fatalError("Error while unwrapping url")}
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        request.httpMethod = method.rawValue
        request.httpBody = body
        try configureParametersAndHeaders(parameters: parameters, headers: headers, request: &request)
        return request
    }

    static func configureParametersAndHeaders(parameters: [String: Any]?,
                                                  headers: [String: String]?,
                                                  request: inout URLRequest) throws {
        do {
            if let headers = headers, let parameters = parameters {
                try request.encode(parameters: parameters)
                try request.setHeaders(headers: headers)
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}

// MARK: - extension
extension URLRequest {
    mutating func encode(parameters: [String: Any]) throws {
        guard let url = self.url else { throw NetworkError.missingURL }

        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                urlComponents.queryItems?.append(queryItem)
            }
            self.url = urlComponents.url
        }
    }
    
    mutating func setHeaders(headers: [String: String]) throws {
        for (key, value) in headers {
            self.setValue(value, forHTTPHeaderField: key)
        }
    }
}
