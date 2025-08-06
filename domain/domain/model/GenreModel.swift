//
//  GenreDomain.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

public struct GenreModel {
    public let genres: [Genre]

    public init(genres: [Genre] = []) {
        self.genres = genres
    }
}
