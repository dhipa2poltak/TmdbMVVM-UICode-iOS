//
//  ReviewEntity.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

struct ReviewEntity {
    let author: String
    let authorDetails: AuthorDetailsEntity?
    let content: String

    init(author: String = "", authorDetails: AuthorDetailsEntity? = nil, content: String = "") {
        self.author = author
        self.authorDetails = authorDetails
        self.content = content
    }
}
