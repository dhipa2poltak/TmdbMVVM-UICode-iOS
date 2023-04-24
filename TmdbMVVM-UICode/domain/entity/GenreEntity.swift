//
//  GenreEntity.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

struct GenreEntity {
    let id: Int
    let name: String

    init(id: Int = -1, name: String = "") {
        self.id = id
        self.name = name
    }
}
