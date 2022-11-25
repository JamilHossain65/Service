//
//  JSONDecoder.swift
//  Macmeter
//
//  Created by Muhammad Salman Zafar on 1/26/22.
//

import Foundation

extension JSONDecoder {
    
    func decode<T: Decodable>(_ type: T.Type, data: Data) -> (error: String?, obj: T?)  {
        do {
            let obj = try JSONDecoder().decode(type, from: data)
            return (error: nil, obj: obj)
        } catch {
            #if DEBUG
            print("error", error)
            #endif
            return (error: error.localizedDescription, nil)
        }
    }
    
}
