//
//  QutationsModel.swift
//  Service
//
//  Created by Hamza on 03/11/2022.
//

import Foundation


struct QutationsRootModel : Codable {
    let status : Int?
    let code : Int?
    let message : String?
    let oData : OData?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case code = "code"
        case message = "message"
        case oData = "oData"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        oData = try values.decodeIfPresent(OData.self, forKey: .oData)
    }

}

struct OData : Codable {
    let data : [QutationsModel]?

    enum CodingKeys: String, CodingKey {

        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([QutationsModel].self, forKey: .data)
    }

}

struct QutationsModel : Codable {
    let id : Int?
    let request_service_date : String?
    let request_service_time : String?
    let no_of_hours : Int?
    let request_query : String?
    let request_media : String?
    let request_status : Int?
    let provider_request_mark_completed : Int?
    let user_request_mark_completed : Int?
    let request_select_provider : String?
    let user_id : Int?
    let provider_id : String?
    let created_at : String?
    let updated_at : String?
    let request_services_id : Int?
    let providers_id : Int?
    let quote_amount : String?
    let quote_description : String?
    let status : Int?
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

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case request_service_date = "request_service_date"
        case request_service_time = "request_service_time"
        case no_of_hours = "no_of_hours"
        case request_query = "request_query"
        case request_media = "request_media"
        case request_status = "request_status"
        case provider_request_mark_completed = "provider_request_mark_completed"
        case user_request_mark_completed = "user_request_mark_completed"
        case request_select_provider = "request_select_provider"
        case user_id = "user_id"
        case provider_id = "provider_id"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case request_services_id = "request_services_id"
        case providers_id = "providers_id"
        case quote_amount = "quote_amount"
        case quote_description = "quote_description"
        case status = "status"
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
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        request_service_date = try values.decodeIfPresent(String.self, forKey: .request_service_date)
        request_service_time = try values.decodeIfPresent(String.self, forKey: .request_service_time)
        no_of_hours = try values.decodeIfPresent(Int.self, forKey: .no_of_hours)
        request_query = try values.decodeIfPresent(String.self, forKey: .request_query)
        request_media = try values.decodeIfPresent(String.self, forKey: .request_media)
        request_status = try values.decodeIfPresent(Int.self, forKey: .request_status)
        provider_request_mark_completed = try values.decodeIfPresent(Int.self, forKey: .provider_request_mark_completed)
        user_request_mark_completed = try values.decodeIfPresent(Int.self, forKey: .user_request_mark_completed)
        request_select_provider = try values.decodeIfPresent(String.self, forKey: .request_select_provider)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        provider_id = try values.decodeIfPresent(String.self, forKey: .provider_id)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        request_services_id = try values.decodeIfPresent(Int.self, forKey: .request_services_id)
        providers_id = try values.decodeIfPresent(Int.self, forKey: .providers_id)
        quote_amount = try values.decodeIfPresent(String.self, forKey: .quote_amount)
        quote_description = try values.decodeIfPresent(String.self, forKey: .quote_description)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        provider_business_name = try values.decodeIfPresent(String.self, forKey: .provider_business_name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
        is_approved = try values.decodeIfPresent(String.self, forKey: .is_approved)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        email_verified_at = try values.decodeIfPresent(String.self, forKey: .email_verified_at)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        remember_token = try values.decodeIfPresent(String.self, forKey: .remember_token)
        user_role = try values.decodeIfPresent(Int.self, forKey: .user_role)
    }

}
