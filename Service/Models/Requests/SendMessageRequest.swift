//
//  SendMessageRequest.swift
//  Service
//
//  Created by Hamza on 04/11/2022.
//

import Foundation

struct SendMessageRequest: BaseNetworkRequestable {
    var provider_id: String
    var message: String
}


