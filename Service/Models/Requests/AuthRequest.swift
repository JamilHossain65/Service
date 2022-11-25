//
//  LoginRequest.swift
//  Service
//
//  Created by Hamza on 12/10/2022.
//

import Foundation

struct LoginRequest: BaseNetworkRequestable {
    var email: String
    var password: String
}

struct RegisterRequest: BaseNetworkRequestable {
    var firstName: String
    var lastName: String
    var mobile: String
    var email: String
    var password: String
    var confirmPassword: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case mobile, email, password
        case confirmPassword = "confirm_password"
    }
    
}
