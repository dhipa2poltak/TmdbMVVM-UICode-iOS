//
//  GenreResponse.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import domain

public struct GenreResponse: Codable {
    let genres: [GenreDTO]?

    enum CodingKeys: String, CodingKey {
        case genres
    }

    init(genres: [GenreDTO]?) {
        self.genres = genres
    }
}

extension GenreResponse {
    func toDomain() -> GenreModel {
        let genreEntities = genres?.map { (genre) -> Genre in
            return Genre(id: genre.id ?? -1, name: genre.name ?? "")
        }

        return GenreModel(genres: genreEntities ?? [])
    }
}
