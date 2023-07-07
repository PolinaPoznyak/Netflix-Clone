//
//  Response.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 6.07.23.
//

import Foundation

struct Response {

    static func handleResponse(for response: HTTPURLResponse?) -> Result<String, NetworkError>{

        guard let res = response else { return Result.failure(NetworkError.noResponse)}

        switch res.statusCode {
        case 200...299: return .success(NetworkError.success.rawValue)
        case 401: return .failure(NetworkError.authenticationError)
        case 400...499: return .failure(NetworkError.badRequest)
        case 500...599: return .failure(NetworkError.serverError)
        default: return .failure(NetworkError.failed)
        }
    }

}
