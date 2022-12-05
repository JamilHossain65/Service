//
//  EndPoint.swift
//  canva
//
//  Created by Muhammad Salman on 8/22/22.
//

import Foundation

enum EndPoint {
    case login(LoginRequest)
    case register(RegisterRequest)
    case dashBoard
    case empty(LoginRequest)
    case userDetail
    case sendRequest(MultipartFormDataRequest)
    case selectService(String)
    case shop
    case contactUs(ContactUsRequest)
    case address
    case addAddress(BaseNetworkRequestable)
    case userRequestList
    case logout
    case userQutations(BaseNetworkRequestable)
    case acceptQutation(Int)
    case rejectQutation(Int)
    case getUserChatList
    case userMessageLIst
    case productDetail(Int)
    case sendUserMessage(BaseNetworkRequestable)
    case addToCart(BaseNetworkRequestable)
    case getCart
    case deleteCartItem(Int)
    case plusCartItem(Int)
    case minusCartItem(Int)
    case uploadImage
    case searchProfessional(String)
}

extension EndPoint {

    var path: String {
        switch self {
        case .login:
            return "user/login"
        case .register:
            return "register"
        case .dashBoard:
            return "user/dashboard"
        case .userDetail:
            return "user/details"
        case .selectService(let value):
            return "user/select-service/" + value
        case .sendRequest:
            return "user/request-service"
        case .shop:
            return "user/shop"
        case .contactUs:
            return "contact-us"
        case .address:
            return "user/list-of-all-addresses"
        case .addAddress:
            return "user/add-address"
        case .userRequestList:
            return "user/my-request"
        case .logout:
            return "user/logout"
        case .userQutations:
            return "user/list-of-all-quotation-recieved"
        case .acceptQutation(let value):
            return "user/accept-quotation/\(value)"
        case .rejectQutation(let value):
            return "user/reject-quotation/\(value)"
        case .getUserChatList:
           return "user/get-all-provider-messages"//"user/get-all-messages"
        case .userMessageLIst:
            return "user/messages"
        case .sendUserMessage:
            return "user/sendMessages"
        case .productDetail(let value):
            return "user/item-detail/\(value)"
        case .addToCart:
            return "user/add-to-cart"
        case .getCart:
            return "user/get-cart-list"
        case .deleteCartItem(let value):
            return "user/delete-cart-list/\(value)"
        case .plusCartItem(let value):
            return "user/plus-cart-product-quantity/\(value)"
        case .minusCartItem(let value):
            return "user/minus-cart-product-quantity/\(value)"
        case .uploadImage, .empty:
            return "upload_image"
        case .searchProfessional(let value):
            return "user/professional-search?search=\(value)"
        }
    }
    
    var query: [URLQueryItem]? {
        switch self {
        case .empty:
            return nil
        case .userQutations(let value):
            return value.associatedValues.map({ URLQueryItem(name: $0.key, value: $0.value) })
        default:
            return nil
        }
    }
    
    var data: Data? {
        switch self {
        case .login(let value):
            return value.jsonData
        case .register(let value):
            return value.jsonData
        case .contactUs(let value):
            return value.jsonData
        case .addAddress(let value), .sendUserMessage(let value), .addToCart(let value):
            return value.jsonData
        default:
            return nil
        }
    }
    
    var method: String {
        switch self {
        case  .uploadImage, .login, .register, .sendRequest, .contactUs, .addAddress, .logout, .acceptQutation, .sendUserMessage, .rejectQutation:
            return HTTPMethod.post.rawValue
        case  .addToCart:
            return HTTPMethod.post.rawValue
        case .productDetail, .plusCartItem, .minusCartItem:
            return HTTPMethod.put.rawValue
        case.deleteCartItem:
            return HTTPMethod.delete.rawValue
        default:
            return HTTPMethod.get.rawValue
        }
    }
    
    var url: URL? {
        var component = URLComponents(string: API.baseUrl + path)
        component?.queryItems = query
        return component?.url
    }
    
    var httpHeaders: [String: String] {
        return [HTTPContentType.json.rawValue: "content-type", "Bearer " + (LoggedUserDetails.shared.authToken ?? ""): "Authorization"]
    }
    
    var urlRequest: URLRequest? {
        guard let url = url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = data
        httpHeaders.forEach({
            request.setValue($0.key, forHTTPHeaderField: $0.value)
        })
        return request
    }
    
}
