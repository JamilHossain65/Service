//
//  ChatListModel.swift
//  Service
//
//  Created by Hamza on 04/11/2022.
//

import Foundation


struct ChatListRootModel: Codable {
    let status: Int
    let code: Int
    let message: String
    let oData: [ChatListModel]?
    let errors: [String: String]?
}

struct ChatListModel : Codable {
    let id: Int
    let user_id: Int
    let provider_id: Int
    let message: String?
    let created_at: String?
    let updated_at: String?
    let provider : ProviderModel?
}

struct UserMessageListRootModel : Codable {
    let status: Int
    let code: Int
    let message: String
    let oData: [UserMessageListModel]?
}

struct UserMessageListModel : Codable {
    let id: Int
    let user_id: Int?
    let provider_id: Int?
    let message: String?
    let created_at: String?
    let sender: String
}

struct SendMessageResponse : Codable {
    let status: Int
    let code: Int?
    let message: String?
}


