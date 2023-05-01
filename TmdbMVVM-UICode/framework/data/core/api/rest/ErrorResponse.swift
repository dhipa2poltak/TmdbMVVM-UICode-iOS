//
//  ErrorResponse.swift
//  TmdbMVVM-UICode
//
//  Created by user on 01/05/23.
//

import Foundation

struct ErrorResponse: Codable {
    let success: Bool?
    let statusCode: Int?
    let statusMessage: String?

    enum CodingKeys: String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }

    init(success: Bool?, statusCode: Int?, statusMessage: String?) {
        self.success = success
        self.statusCode = statusCode
        self.statusMessage = statusMessage
    }
}
