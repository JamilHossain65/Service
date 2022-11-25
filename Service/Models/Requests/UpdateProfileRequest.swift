//
//  UpdateProfileRequest.swift
//  Service
//
//  Created by Hamza on 26/10/2022.
//

import Foundation

struct UpdateProfileRequest: BaseNetworkRequestable {
    var first_name: String
    var last_name: String
    var mobile: String
    var message: String
}
