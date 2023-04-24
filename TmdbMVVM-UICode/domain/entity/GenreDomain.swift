//
//  GenreDomain.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

struct GenreDomain {
    let genres: [GenreEntity]

    init(genres: [GenreEntity] = []) {
        self.genres = genres
    }
}
