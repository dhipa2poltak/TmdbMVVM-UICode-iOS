//
//  AppError.swift
//  TmdbMVVM-UICode
//
//  Created by user on 01/05/23.
//

import Foundation

public enum AppError: Error {
    case networkError(message: String)
}

extension AppError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .networkError(message):
            return message
        }
    }
}
