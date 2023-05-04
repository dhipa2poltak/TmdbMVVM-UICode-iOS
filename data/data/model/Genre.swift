//
//  Genre.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation

struct Genre: Codable {
    let id: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }

    init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}
