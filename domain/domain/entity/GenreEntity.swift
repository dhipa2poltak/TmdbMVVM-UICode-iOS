//
//  GenreEntity.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

public struct GenreEntity {
    public let id: Int
    public let name: String

    public init(id: Int = -1, name: String = "") {
        self.id = id
        self.name = name
    }
}
