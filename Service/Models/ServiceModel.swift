//
//  ServiceModel.swift
//  Service
//
//  Created by Hamza on 22/10/2022.
//

import Foundation

struct ServiceRootModel: Codable {
    let status: Int
    let code: Int
    let message: String
    let oData: ProviderData
}

struct ProviderData : Codable {
    let id : Int?
    let first_name : String?
    let last_name : String?
    let provider_business_name : String?
    let image : String?
    let mobile : String?
    let is_approved : String?
    let email : String?
    let email_verified_at : String?
    let password : String?
    let remember_token : String?
    let user_role : Int?
    let created_at : String?
    let updated_at : String?
    
    let services: [ServiceModel]?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case first_name = "first_name"
        case last_name = "last_name"
        case provider_business_name = "provider_business_name"
        case image = "image"
        case mobile = "mobile"
        case is_approved = "is_approved"
        case email = "email"
        case email_verified_at = "email_verified_at"
        case password = "password"
        case remember_token = "remember_token"
        case user_role = "user_role"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case services = "services"
    }
}

struct ServiceModel: Codable {
//    let id: Int
//    let service_name: String
//    let subcategory_id: Int
//    let category_id: Int
//    let service_status: Int
//    let provider_id: Int
    
    let id: Int
    let service_name: String
    let sub_category_id: Int
    let category_id: Int
    
    let sub_category_name: String?
    let category_name: String?
    
    let service_status: Int
    let service_description: String?
    let service_image: String?
    let provider_id: Int
    let created_at: String?
    let updated_at: String?
}




