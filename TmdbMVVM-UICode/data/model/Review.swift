//
//  Review.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation

class Review: Codable {
    let author: String?
    let authorDetails: AuthorDetails?
    let content: String?
    let createdAt: String?//Date?
    let id: String?
    let updatedAt: String?//Date?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
    }

    init(
        author: String?,
        authorDetails: AuthorDetails?,
        content: String?,
        createdAt: String/*Date?*/,
        id: String?,
        updatedAt: String/*Date?*/,
        url: String?
    ) {
        self.author = author
        self.authorDetails = authorDetails
        self.content = content
        self.createdAt = createdAt
        self.id = id
        self.updatedAt = updatedAt
        self.url = url
    }
}
