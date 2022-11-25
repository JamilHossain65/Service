//
//  File.swift
//  canva
//
//  Created by Muhammad Salman on 8/22/22.
//

import Foundation

// MARK: - UploadFileResponse
struct UploadFileResponse: Codable {
    let fieldname, originalname, encoding, mimetype: String
    let destination, filename, path: String
    let size: Int
}
