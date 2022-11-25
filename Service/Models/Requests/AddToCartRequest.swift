//
//  AddToCartRequest.swift
//  Service
//
//  Created by Hamza on 12/11/2022.
//

import Foundation

struct AddToCartRequest: BaseNetworkRequestable {
    var quantity: Int
    var item_id: Int
}

