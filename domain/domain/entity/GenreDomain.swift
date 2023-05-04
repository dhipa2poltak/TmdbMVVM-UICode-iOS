//
//  GenreDomain.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

public struct GenreDomain {
    public let genres: [GenreEntity]

    public init(genres: [GenreEntity] = []) {
        self.genres = genres
    }
}
