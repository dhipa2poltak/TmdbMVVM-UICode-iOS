//
//  MovieEntity.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

public struct Movie {
    public let id: Int
    public let title: String
    public let overview: String
    public let imageUrl: String

    public init(id: Int = -1, title: String = "", overview: String = "", imageUrl: String = "") {
        self.id = id
        self.title = title
        self.overview = overview
        self.imageUrl = imageUrl
    }
}
