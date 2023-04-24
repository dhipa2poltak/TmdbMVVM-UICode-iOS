//
//  TrailerEntity.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

struct TrailerEntity {
    let id: String
    let key: String
    let name: String
    let site: String

    init(id: String = "", key: String = "", name: String = "", site: String = "") {
        self.id = id
        self.key = key
        self.name = name
        self.site = site
    }
}
