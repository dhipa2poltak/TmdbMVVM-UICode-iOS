//
//  ErrorResponse.swift
//  TmdbMVVM-UICode
//
//  Created by user on 01/05/23.
//

import Foundation

public struct ErrorResponse: Codable {
    public let success: Bool?
    public let statusCode: Int?
    public let statusMessage: String?

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
