//
//  TrailerResponse.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import domain

public struct TrailerResponse: Codable {
    let id: Int?
    let results: [Trailer]?

    enum CodingKeys: String, CodingKey {
        case id
        case results
    }

    init(
        id: Int?,
        results: [Trailer]?
    ) {
        self.id = id
        self.results = results
    }
}

extension TrailerResponse {
    func toDomain() -> TrailerDomain {
        let trailerEntities = results?.map { (trailer) -> TrailerEntity in
            return TrailerEntity(
                id: trailer.id ?? "",
                key: trailer.key ?? "",
                name: trailer.name ?? "",
                site: trailer.site ?? ""
            )
        }

        return TrailerDomain(id: self.id ?? -1, results: trailerEntities ?? [])
    }
}
