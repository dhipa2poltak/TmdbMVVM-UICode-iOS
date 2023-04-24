//
//  TrailerDomain.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

struct TrailerDomain {
    let id: Int
    let results: [TrailerEntity]

    init(id: Int = -1, results: [TrailerEntity] = []) {
        self.id = id
        self.results = results
    }
}
