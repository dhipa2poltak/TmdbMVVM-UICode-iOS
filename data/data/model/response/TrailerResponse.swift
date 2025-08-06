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
    let results: [TrailerDTO]?

    enum CodingKeys: String, CodingKey {
        case id
        case results
    }

    init(
        id: Int?,
        results: [TrailerDTO]?
    ) {
        self.id = id
        self.results = results
    }
}

extension TrailerResponse {
    func toDomain() -> TrailerModel {
        let trailerEntities = results?.map { (trailer) -> Trailer in
            return Trailer(
                id: trailer.id ?? "",
                key: trailer.key ?? "",
                name: trailer.name ?? "",
                site: trailer.site ?? ""
            )
        }

        return TrailerModel(id: self.id ?? -1, results: trailerEntities ?? [])
    }
}
