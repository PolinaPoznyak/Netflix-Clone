//
//  NetworkError.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 6.07.23.
//

import Foundation

public enum NetworkError: String, Error {
    case parametersNil =        "Parameters were nil"
    case encodingFailed =       "Parameter Encoding failed"
    case decodingFailed =       "Unable to Decode data"
    case missingURL =           "The URL is nil"
    case couldNotParse =        "Unable to parse the JSON response"
    case noData =               "Data is nil"
    case fragmentResponse =     "Response's body has fragments"
    case authenticationError =  "You must be authenticated"
    case badRequest =           "Bad request"
    case pageNotFound =         "Page not found"
    case failed =               "Request failed"
    case serverError =          "Server error"
    case noResponse =           "No response"
    case success =              "Success"
}
