//
//  AddressModel.swift
//  Service
//
//  Created by Hamza on 26/10/2022.
//

import Foundation

struct AddressRootModel: Codable {
    let status: Int
    let code: Int
    let message: String
    let oData: [AddressModel]?
    let errors: [String: String]?
}

struct AddressModel: Codable {
    let id: Int
    let address_title: String
    let complete_address: String
    let is_default: Int
    let user_id: Int
}

struct AddAddressRootModel: Codable {
    let status: Int
    let code: Int
    let message: String
    let oData: AddressModel?
    let errors: [String: String]?
}
