//
//  Movie.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 6.07.23.
//

import Foundation

struct Movie {
    let id: Int
    let title: String
    let posterPath: String
    let releaseDate: String
}

// properties within a Movie returned from the API that we want to extract the info from
extension Movie: Codable {

    enum MovieCodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title
        case releaseDate = "release_date"
    }

    init(from decoder: Decoder) throws {
        // Decode each of the properties from the API into the appropriate type (string, etc.) for their associated struct variable
        let movieContainer = try decoder.container(keyedBy: MovieCodingKeys.self)
        id = try movieContainer.decode(Int.self, forKey: .id)
        posterPath = try movieContainer.decode(String.self, forKey: .posterPath)
        title = try movieContainer.decode(String.self, forKey: .title)
        releaseDate = try movieContainer.decode(String.self, forKey: .releaseDate)
    }
}
