//
//  DiscoverMovieByGenreResponse.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation

class DiscoverMovieByGenreResponse: Codable {
    let page: Int?
    let results: [Movie]?
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
        results: [Movie]?,
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
    func toDomain() -> DiscoverMovieByGenreDomain {
        let movieEntities = results?.map { (movie) -> MovieEntity in
            return MovieEntity(
                id: movie.id ?? -1,
                title: movie.title ?? "",
                overview: movie.overview ?? "",
                imageUrl: (!(movie.posterPath?.isEmpty ?? true)) ? BuildConfiguration.shared.IMAGE_URL_BASE_PATH + (movie.posterPath ?? "") : ""
            )
        }

        return DiscoverMovieByGenreDomain(
            page: self.page ?? -1,
            results: movieEntities ?? [],
            totalPages: self.totalPages ?? -1,
            totalResults: self.totalResults ?? -1
        )
    }
}
