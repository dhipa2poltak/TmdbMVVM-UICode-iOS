//
//  Trailer.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation

struct TrailerDTO: Codable {
    let id: String?
    let iso6391: String?
    let iso31661: String?
    let key: String?
    let name: String?
    let site: String?
    let size: Int?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id
        case iso6391 = "iso_639_1"
        case iso31661 = "iso_3166_1"
        case key
        case name
        case site
        case size
        case type
    }

    init(
        id: String?,
        iso6391: String?,
        iso31661: String?,
        key: String?,
        name: String?,
        site: String?,
        size: Int?,
        type: String?
    ) {
        self.id = id
        self.iso6391 = iso6391
        self.iso31661 = iso31661
        self.key = key
        self.name = name
        self.site = site
        self.size = size
        self.type = type
    }
}
