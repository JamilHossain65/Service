//
//  Array+Extension.swift
//  TheBeats
//
//  Created by Bd Stock Air-M on 11/10/22.
//

import Foundation

extension Array where Element: Hashable {
    func uniqued() -> [Element] {
        var seen = Set<Element>()
        return filter { element in
            seen.insert(element).inserted
        }
    }
}
