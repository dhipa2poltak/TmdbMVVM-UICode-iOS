//
//  ReviewDomain.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

struct ReviewDomain {
    let results: [ReviewEntity]

    init(results: [ReviewEntity] = []) {
        self.results = results
    }
}
