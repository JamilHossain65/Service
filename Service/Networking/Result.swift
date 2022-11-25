//
//  Result.swift
//  canva
//
//  Created by Muhammad Salman on 8/22/22.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(String)
}
