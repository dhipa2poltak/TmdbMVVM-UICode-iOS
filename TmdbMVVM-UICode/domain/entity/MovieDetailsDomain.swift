//
//  MovieDetailsDomain.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

struct MovieDetailsDomain {
    let id: Int
    let overview: String
    let title: String
    let imageUrl: String

    init(id: Int = -1, overview: String = "", title: String = "", imageUrl: String = "") {
        self.id = id
        self.overview = overview
        self.title = title
        self.imageUrl = imageUrl
    }
}
