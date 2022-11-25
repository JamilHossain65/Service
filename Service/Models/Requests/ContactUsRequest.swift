//
//  ContactUsRequest.swift
//  Service
//
//  Created by Hamza on 22/10/2022.
//

import Foundation

struct ContactUsRequest: BaseNetworkRequestable {
    var name: String
    var mobile: String
    var report_type: String
    var message: String
}
