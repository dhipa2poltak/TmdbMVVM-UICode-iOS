//
//  MovieDetailsDomain.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

public struct MovieDetailsDomain {
    public let id: Int
    public let overview: String
    public let title: String
    public let imageUrl: String

    public init(id: Int = -1, overview: String = "", title: String = "", imageUrl: String = "") {
        self.id = id
        self.overview = overview
        self.title = title
        self.imageUrl = imageUrl
    }
}
