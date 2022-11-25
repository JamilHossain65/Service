//
//  DashBoardModel.swift
//  Service
//
//  Created by Hamza on 19/10/2022.
//

import Foundation

struct DashboardModel: Codable {
    let status: Int
    let code: Int
    let message: String
    let oData: [MainCategoryModel]?                                                         
}

struct MainCategoryModel: Codable {
    let id: Int
    let category_name: String?
    let category_priority: Int?
    let category_status: Int?
    let created_at: String?
    let updated_at: String?
    var sub_categories: [SubCategoryModel]?
}

struct SubCategoryModel: Codable {
    let id: Int
    let subcategory_name: String?
    let category_id: Int
    let subcategory_image: String?
    let subcategory_status: Int
}
