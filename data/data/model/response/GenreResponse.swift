//
//  GenreResponse.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import domain

public struct GenreResponse: Codable {
    let genres: [Genre]?

    enum CodingKeys: String, CodingKey {
        case genres
    }

    init(genres: [Genre]?) {
        self.genres = genres
    }
}

extension GenreResponse {
    func toDomain() -> GenreDomain {
        let genreEntities = genres?.map { (genre) -> GenreEntity in
            return GenreEntity(id: genre.id ?? -1, name: genre.name ?? "")
        }

        return GenreDomain(genres: genreEntities ?? [])
    }
}
