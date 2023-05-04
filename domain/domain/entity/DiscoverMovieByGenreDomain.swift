//
//  DiscoverMovieByGenreDomain.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

public struct DiscoverMovieByGenreDomain {
    public let page: Int
    public let results: [MovieEntity]
    public let totalPages: Int
    public let totalResults: Int

    public init(page: Int = 1, results: [MovieEntity] = [], totalPages: Int = -1, totalResults: Int = -1) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}
