//
//  ReviewDomain.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

public struct ReviewModel {
    public let results: [Review]

    public init(results: [Review] = []) {
        self.results = results
    }
}
