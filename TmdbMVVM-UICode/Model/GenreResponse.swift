//
//  GenreResponse.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation

class GenreResponse: Codable {
    let genres: [Genre]?

    enum CodingKeys: String, CodingKey {
        case genres
    }

    init(genres: [Genre]?) {
        self.genres = genres
    }
}
