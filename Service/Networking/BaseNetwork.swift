//
//  BaseNetwork.swift
//  canva
//
//  Created by Muhammad Salman on 8/22/22.
//

import Foundation

enum HTTPMethod: String {
    case get        = "GET"
    case post       = "POST"
    case put        = "PUT"
    case delete     = "DELETE"
    case patch      = "PATCH"
    case head       = "HEAD"
    case trace      = "TRACE"
    case connect    = "CONNECT"
    case options    = "OPTIONS"
}

enum HTTPContentType: String {
    //If needed more content type can be define here
    case json               = "application/json"
    case xml                = "text/xml; charset=utf-8"
    case formurlencoded     = "application/x-www-form-urlencoded"
    case multipartFormData  = "formData"
}
