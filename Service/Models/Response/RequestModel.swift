//
//  RequestModel.swift
//  Service
//
//  Created by Hamza on 27/10/2022.
//

import Foundation

struct requestsRootModel: Codable {
    let status: Int
    let code: Int
    let message: String
    let oData: requestsModel?
    let errors: [String: String]?
}

struct requestsModel: Codable {
    let pendingRequests: [pendingsRequestsModel]?
    let completedRequests: [pendingsRequestsModel]?
}

struct pendingsRequestsModel: Codable {
    let id: Int
    let request_service_date: String?
    let request_service_time: String?
    let no_of_hours: Int?
    let request_query: String?
    let request_media: String?
    let request_status: Int?
    let request_select_provider: String?
    let user_id: Int
    let provider_id: Int?
}
