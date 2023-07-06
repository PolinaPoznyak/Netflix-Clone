//
//  AuthenticationTokenResponse.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 6.07.23.
//

import Foundation

struct AuthenticationTokenResponse: Codable {
    let success: Bool
    let expires_at: String
    let request_token: String
}
