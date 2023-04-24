//
//  DiscoverMovieByGenreDomain.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

struct DiscoverMovieByGenreDomain {
    let page: Int
    let results: [MovieEntity]
    let totalPages: Int
    let totalResults: Int

    init(page: Int = 1, results: [MovieEntity] = [], totalPages: Int = -1, totalResults: Int = -1) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}
