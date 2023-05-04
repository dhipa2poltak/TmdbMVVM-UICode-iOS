//
//  AuthorDetailsEntity.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

public struct AuthorDetailsEntity {
    public let avatarPath: String

    public init(avatarPath: String = "") {
        self.avatarPath = avatarPath
    }
}
