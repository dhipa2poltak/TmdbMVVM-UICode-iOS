//
//  TrailerEntity.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

public struct Trailer {
    public let id: String
    public let key: String
    public let name: String
    public let site: String

    public init(id: String = "", key: String = "", name: String = "", site: String = "") {
        self.id = id
        self.key = key
        self.name = name
        self.site = site
    }
}
