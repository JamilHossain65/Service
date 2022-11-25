//
//  Dictionary.swift
//  Macmeter
//
//  Created by Muhammad Salman Zafar on 1/27/22.
//

import Foundation

extension Dictionary {
    
    func jsonData() -> Data? {
        try? JSONSerialization.data(withJSONObject: self, options: .fragmentsAllowed)
    }
}
