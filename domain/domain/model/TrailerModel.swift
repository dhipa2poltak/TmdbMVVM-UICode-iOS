//
//  TrailerDomain.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

public struct TrailerModel {
    public let id: Int
    public let results: [Trailer]

    public init(id: Int = -1, results: [Trailer] = []) {
        self.id = id
        self.results = results
    }
}
