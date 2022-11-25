//
//  DefaultError.swift
//  canva
//
//  Created by Muhammad Salman on 8/22/22.
//

import Foundation

enum DefaultError: Error {
    case unknown
    case exception(error: Error?)
    case failure(message: String)
    case responseError(errorStatus: Error?)
    case unauthorized
}

struct ErrorDetails: Codable {
    let code: Int?
    let id: String?
    let message: String
}
