//
//  User.swift
//  Service
//
//  Created by Hamza on 12/10/2022.
//

import Foundation

struct SignupModel: Codable {
    let status: Int
    let code: Int
    let message: String
    let errors: [String: [String]]
    let oData: SignupData?
}

struct SignupData: Codable {
    let token: String?
    let user: User?
}

struct User: Codable {
    let id: Int?
    let firstName: String?
    let lastName: String?
    let userName: String?
    let email: String?
    let mobail: String?
    let token: String?
    let createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName  = "last_name"
        case userName  = "username"
        case email, token, mobail
        case createdAt = "created_at"
    }
    
    var fullName: String {
        var title = ""
        title += (firstName ?? "")
        if let lastName = lastName {
            title += " " + String(lastName)
        }
        return title
    }
   
}

struct LoginModel: Codable {
    let status: Int?
    let code: Int?
    let token: String?
    let message: String?
    let errors: [String: String]?
}

struct UserModel: Codable {
    let status: Int
    let code: Int
    let message: String
    let oData: User?
    let errors: [String: String]?
}
