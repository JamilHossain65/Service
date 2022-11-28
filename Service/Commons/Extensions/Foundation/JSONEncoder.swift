//
//  JSONEncoder.swift
//  Macmeter
//
//  Created by Muhammad Salman Zafar on 1/26/22.
//

import Foundation

extension Encodable {
    func encoded() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
