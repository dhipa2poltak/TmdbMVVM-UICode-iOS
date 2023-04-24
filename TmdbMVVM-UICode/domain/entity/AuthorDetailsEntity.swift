//
//  AuthorDetailsEntity.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation

struct AuthorDetailsEntity {
    let avatarPath: String

    init(avatarPath: String = "") {
        self.avatarPath = avatarPath
    }
}
