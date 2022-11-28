//
//  AppUserDefaults.swift
//  NationalTM
//
//  Created by Hamza on 15/08/2022.
//

import Foundation
import UIKit

//class AppUserDefault {
//    
//    static let shared = AppUserDefault()
//    private init(){}
//    
//    var BGMusicOff:  Bool? {
//        set {
//            UserDefaults.standard.set(newValue, forKey:"BGMusicOff" )
//            UserDefaults.standard.synchronize()
//        }
//        get {
//            return UserDefaults.standard.bool(forKey: "BGMusicOff")
//        }
//    }
//    
//    var currentLanguage:  String? {
//        set {
//            UserDefaults.standard.set(newValue, forKey:"currentLanguage" )
//            UserDefaults.standard.synchronize()
//        }
//        get {
//            return UserDefaults.standard.string(forKey: "currentLanguage")
//        }
//    }
//    
//    var currentFact:  Int? {
//        set {
//            UserDefaults.standard.set(newValue, forKey:"currentFact" )
//            UserDefaults.standard.synchronize()
//        }
//        get {
//            return UserDefaults.standard.integer(forKey: "currentFact")
//        }
//    }
//    
//    var interActiveSce:  Int? {
//        set {
//            UserDefaults.standard.set(newValue, forKey:"interActiveSce" )
//            UserDefaults.standard.synchronize()
//        }
//        get {
//            return UserDefaults.standard.integer(forKey: "interActiveSce")
//        }
//    }
//    
//    var shaked:  Bool? {
//        set {
//            UserDefaults.standard.set(newValue, forKey:"shaked" )
//            UserDefaults.standard.synchronize()
//        }
//        get {
//            return UserDefaults.standard.bool(forKey: "shaked")
//        }
//    }
//    
//}

extension UserDefaults {
    
    struct AppUserDefault {
        static let token = "token"
        static let userProfile = "userProfile"
        static let trip = "trip"
        static let waitingTime = "waitingTime"
        static let time = "time"
        static let km = "km"
        static let userKmCalculation = "userKmCalculation"
        static let trackUserKM = "trackUserKM"
        static let lastLocation = "lastLocation"
        static let lastDate = "lastDate"
        static let droppedAt = "droppedAt"
        static let pickedAt = "pickedAt"
        static let tripStarted = "tripStarted"
        static let language = "Language"
        static let arePushNotificationEnabled = "pushNotificaions"
        static let userDefinedFixedRate = "userDefinedFixedRate"
        static let userDefinedEnabled = "userDefinedFixedRateEnabled"
        static let publicHolidayEnabled = "publicHolidayEnabled"
        static let dayCycle = "dayCycle"
        static let appLanguage = "appLanguage"
        static let authToken = "authToken"
        static let isRemember = "isRemember"
        static let isUser = "isUser"
    }
}
