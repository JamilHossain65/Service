//
//  BaseNetworkRequestable.swift
//  canva
//
//  Created by Muhammad Salman on 8/22/22.
//

import Foundation

protocol BaseNetworkRequestable: Codable {
    var jsonData: Data? { get }
    var associatedValues: [String: String] { get }
}

extension BaseNetworkRequestable {
    
    var associatedValues: [String: String] {
        var values = [String: String]()
        guard let associated = Mirror(reflecting: self).children.first else {
            return values
        }

        let children = Mirror(reflecting: associated.value).children
        for case let item in children {
            if let label = item.label {
                values[label] = String(describing: item.value)
            }
        }
        return values
    }
    
    var jsonData: Data? {
        self.encoded()
    }
    
}
