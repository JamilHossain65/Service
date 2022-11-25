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
    let oData: [ServiceModel]?
}

struct ServiceModel: Codable {
    let id: Int
    let service_name: String
    let subcategory_id: Int
    let category_id: Int
    let service_status: Int
    let provider_id: Int
}




