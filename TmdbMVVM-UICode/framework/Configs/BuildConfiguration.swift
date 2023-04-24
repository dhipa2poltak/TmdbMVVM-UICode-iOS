//
//  BuildConfiguration.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation

enum Environment: String {
    case debugStaging = "Debug Staging"
    case releaseStaging = "Release Staging"

    case debugVerify = "Debug Verify"
    case releaseVerify = "Release Verify"

    case debugProduction = "Debug Production"
    case releaseProduction = "Release Production"
}

class BuildConfiguration {
    static let shared = BuildConfiguration()

    var environment: Environment

    var API_BASE_URL: String {
        switch environment {
        case .debugStaging, .releaseStaging:
            return "https://api.themoviedb.org/"
        case .debugVerify, .releaseVerify:
            return "https://api.themoviedb.org/"
        case .debugProduction, .releaseProduction:
            return "https://api.themoviedb.org/"
        }
    }

    let IMAGE_URL_BASE_PATH = "https://image.tmdb.org/t/p/w342//"
    let API_KEY = "bf5c57d57d1c81706c6ef4794e8d753e"

    init() {
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as! String

        environment = Environment(rawValue: currentConfiguration)!
    }
}
