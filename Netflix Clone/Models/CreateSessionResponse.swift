//
//  CreateSessionResponse.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 6.07.23.
//

import Foundation

struct CreateSessionResponse: Codable {
    let success: Bool
    let sessionId: String
}
