//
//  CartModel.swift
//  Service
//
//  Created by Hamza on 15/11/2022.
//

import Foundation

struct CartRootModel : Codable {
    let status : Int?
    let code : Int?
    let message : String?
    let oData : CartoData?
    let errors : [String: String?]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case code = "code"
        case message = "message"
        case oData = "oData"
        case errors = "errors"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        oData = try values.decodeIfPresent(CartoData.self, forKey: .oData)
        errors = try values.decodeIfPresent([String: String?].self, forKey: .errors)
    }

}

struct CartoData: Codable {
    let cartList: [CartModel]?
    let totalCartPrice: Int
    let totalCartQuantity: Int
}

struct CartModel : Codable {
    let id : Int?
    let user_id : Int?
    let item_id : Int?
    let provider_id : Int?
    let quantity : String?
    let price : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?
    let items : Items?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user_id = "user_id"
        case item_id = "item_id"
        case provider_id = "provider_id"
        case quantity = "quantity"
        case price = "price"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case items = "items"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        item_id = try values.decodeIfPresent(Int.self, forKey: .item_id)
        provider_id = try values.decodeIfPresent(Int.self, forKey: .provider_id)
        quantity = try values.decodeIfPresent(String.self, forKey: .quantity)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        items = try values.decodeIfPresent(Items.self, forKey: .items)
    }

}

struct Items : Codable {
    let id : Int?
    let title : String?
    let description : String?
    let image : String?
    let price : String?
    let quantity : String?
    let provider_id : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case description = "description"
        case image = "image"
        case price = "price"
        case quantity = "quantity"
        case provider_id = "provider_id"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        quantity = try values.decodeIfPresent(String.self, forKey: .quantity)
        provider_id = try values.decodeIfPresent(Int.self, forKey: .provider_id)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
