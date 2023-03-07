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
