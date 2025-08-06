//
//  DiscoverMovieByGenreResponse.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import domain

public struct DiscoverMovieByGenreResponse: Codable {
    let page: Int?
    let results: [MovieDTO]?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    init(
        page: Int?,
        results: [MovieDTO]?,
        totalPages: Int?,
        totalResults: Int?
    ) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

extension DiscoverMovieByGenreResponse {
    func toDomain() -> DiscoverMovieByGenreModel {
        let movieEntities = results?.map { (movie) -> Movie in
            return Movie(
                id: movie.id ?? -1,
                title: movie.title ?? "",
                overview: movie.overview ?? "",
                imageUrl: (!(movie.posterPath?.isEmpty ?? true)) ? DataConstants.IMAGE_URL_BASE_PATH + (movie.posterPath ?? "") : ""
            )
        }

        return DiscoverMovieByGenreModel(
            page: self.page ?? -1,
            results: movieEntities ?? [],
            totalPages: self.totalPages ?? -1,
            totalResults: self.totalResults ?? -1
        )
    }
}
