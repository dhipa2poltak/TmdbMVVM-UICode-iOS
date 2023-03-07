//
//  ReviewResponse.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation

class ReviewResponse: Codable {
    let id: Int?
    let page: Int?
    let results: [Review]?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    init(
        id: Int?,
        page: Int?,
        results: [Review]?,
        totalPages: Int?,
        totalResults: Int?
    ) {
        self.id = id
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}


