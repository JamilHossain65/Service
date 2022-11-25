//
//  BaseModel.swift
//  Service
//
//  Created by Hamza on 22/10/2022.
//

import Foundation
struct BaseModel: Codable {
    let status: Int
    let code: Int
    let message: String?
    let errors: [String: [String]?]?
}

struct CartBaseModel: Codable {
    let status: Int
    let code: Int
    let message: String?
}
