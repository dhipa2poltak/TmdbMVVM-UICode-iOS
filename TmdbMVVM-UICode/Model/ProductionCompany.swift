//
//  ProductionCompany.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation

class ProductionCompany: Codable {
    let name: String?
    let originCountry: String?
    let logoPath: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case name
        case originCountry = "origin_country"
        case logoPath = "logo_path"
        case id
    }

    init(
        name: String?,
        originCountry: String?,
        logoPath: String?,
        id: Int?
    ) {
        self.name = name
        self.originCountry = originCountry
        self.logoPath = logoPath
        self.id = id
    }
}
