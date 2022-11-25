//
//  AddAddressRequest.swift
//  Service
//
//  Created by Hamza on 26/10/2022.
//

import Foundation

struct AddAddressRequest: BaseNetworkRequestable {
    var address_title: String
    var complete_address: String
    var is_default: Int
    var user_id: Int
}
