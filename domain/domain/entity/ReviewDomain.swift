//
//  ReviewDomain.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

public struct ReviewDomain {
    public let results: [ReviewEntity]

    public init(results: [ReviewEntity] = []) {
        self.results = results
    }
}
