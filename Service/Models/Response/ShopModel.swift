//
//  ShopModel.swift
//  Service
//
//  Created by Hamza on 22/10/2022.
//

import Foundation

struct ShopRootModel: Codable {
    let status: Int
    let code: Int
    let message: String
    let oData: ShopModel?
    let errors: [String: [String]]?
}

struct ShopModel: Codable {
    let categories: [ShopCategoryModel]
    let providerWithProfessionalItems: [CompanyModel]?
}

struct CompanyModel: Codable {
    let id: Int
    let first_name: String?
    let last_name: String?
    let provider_business_name: String?
    let provider_image: String?
    let mobile: String?
    let is_approved: String?
    let email: String?
    let email_verified_at: String?
    let password: String?
    let remember_token: String?
    let user_role: Int?
    let created_at: String?
    let updated_at: String?
    let professional_items: [ProfessionalItemModel]
}

struct ProfessionalItemModel: Codable {
    let id: Int
    let title: String
    let description: String
    let image: String
    let price: String
    let quantity: String
    let provider_id: Int
    let created_at: String
    let updated_at: String
}


struct ShopCategoryModel: Codable {
    let id: Int
    let category_name: String
    let category_priority: Int
    let category_status: Int
}
