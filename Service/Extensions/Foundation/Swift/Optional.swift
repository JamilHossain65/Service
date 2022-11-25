//
//  Optional.swift
//  QCSM4
//
//  Created by Yasir Basharat on 27/02/2019.
//  Copyright © 2019 Yasir Basharat. All rights reserved.
//

extension Optional where Wrapped: Collection {

    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }

    func orThrow(_ errorExpression: @autoclosure () -> Error) throws -> Wrapped {
        guard let value = self else {
            throw errorExpression()
        }
        return value
    }
}

extension Optional where Wrapped == String {

    var nilIfEmpty: String? {
        guard let self = self else {
            return nil
        }
        return self.isEmpty ? nil : self
    }

    var stringValue: String {
        guard let self = self else {
            return ""
        }
        return self.isEmpty ? "" : self
    }
}

extension Optional where Wrapped == Int32 {

    var intValue: Int32 {
        guard let self = self else {
            return 0
        }
        return self
    }
}

 extension Optional {

    var isNil: Bool {

        guard case Optional.none = self else {
            return false
        }

        return true
    }
}
