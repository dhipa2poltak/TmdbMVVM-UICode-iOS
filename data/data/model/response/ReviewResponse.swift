//
//  ReviewResponse.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import domain

public struct ReviewResponse: Codable {
    let id: Int?
    let page: Int?
    let results: [ReviewDTO]?
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
        results: [ReviewDTO]?,
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

extension ReviewResponse {
    func toDomain() -> ReviewModel {
        let reviewEntities = results?.map { (review) -> Review in
            var imageUrl = review.authorDetails?.avatarPath ?? ""
            if imageUrl.starts(with: "/") {
                imageUrl.remove(at: imageUrl.startIndex)
            }

            if !imageUrl.starts(with: "http") {
                imageUrl = ""
            }

            let authorDetailsEntity = AuthorDetails(avatarPath: imageUrl)
            let reviewEntity = Review(
                author: review.author ?? "",
                authorDetails: authorDetailsEntity,
                content: review.content ?? ""
            )

            return reviewEntity
        }

        return ReviewModel(results: reviewEntities ?? [])
    }
}
