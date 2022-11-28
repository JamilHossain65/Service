//
//  Date.swift
//  TheBeats
//
//  Created by MacBook Air on 8/1/22.
//

import Foundation

let yyyy_MM_dd_hh_mm_ss = "yyyy-MM-dd hh:mm:ss"
let yyyy_MM_dd = "yyyy.MM.dd"

extension Date {
   func getDateWith(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

extension Int {

 var seconds: Int {
    return self
 }

 var minutes: Int {
    return self.seconds * 60
 }

 var hours: Int {
    return self.minutes * 60
 }

 var days: Int {
    return self.hours * 24
 }

 var weeks: Int {
    return self.days * 7
 }

 var months: Int {
    return self.weeks * 4
 }

 var years: Int {
    return self.months * 12
 }
}

