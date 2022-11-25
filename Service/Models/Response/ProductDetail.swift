//
//  ProductDetail.swift
//  Service
//
//  Created by Hamza on 12/11/2022.
//


import Foundation

struct ProductDetailRootModel : Codable {
    let status : Int?
    let code : Int?
    let message : String?
    let oData : ProductDetailModel?
    let errors: [String: String?]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case code = "code"
        case message = "message"
        case oData = "oData"
        case errors
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        oData = try values.decodeIfPresent(ProductDetailModel.self, forKey: .oData)
        errors = try values.decodeIfPresent([String: String?].self, forKey: .errors)
    }

}

struct ProductDetailModel : Codable {
    let id : Int?
    let title : String?
    let description : String?
    let image : String?
    let price : String?
    let quantity : String?
    let provider_id : Int?
    let created_at : String?
    let updated_at : String?
    let reviews : [Reviews]?

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
        case reviews = "reviews"
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
        reviews = try values.decodeIfPresent([Reviews].self, forKey: .reviews)
    }

}

struct Reviews : Codable {
    let id : Int?
    let review : String?
    let rating : Int?
    let user_id : Int?
    let professional_item_id : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case review = "review"
        case rating = "rating"
        case user_id = "user_id"
        case professional_item_id = "professional_item_id"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        review = try values.decodeIfPresent(String.self, forKey: .review)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        professional_item_id = try values.decodeIfPresent(Int.self, forKey: .professional_item_id)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
