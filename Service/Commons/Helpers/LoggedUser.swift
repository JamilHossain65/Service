//
//  LoggedUser.swift
//  canva
//
//  Created by Hamza on 23/08/2022.
//

import Foundation
import Firebase

let isDebug = true

class LoggedUserDetails {
    
    static let shared = LoggedUserDetails()
    private(set) var user: User?
    private(set) var token: String? {
        get {
            UserDefaults.standard.string(forKey: UserDefaults.AppUserDefault.token)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: UserDefaults.AppUserDefault.token)
        }
    }
    
    
     var authToken: String? {
        get {
            UserDefaults.standard.string(forKey: UserDefaults.AppUserDefault.authToken)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: UserDefaults.AppUserDefault.authToken)
        }
    }
    
    var isRemember: Bool? {
        get {
            UserDefaults.standard.bool(forKey: UserDefaults.AppUserDefault.isRemember)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: UserDefaults.AppUserDefault.isRemember)
        }
    }
    
    var fcmToken: String? {
        didSet {
            syncFCMToken()
        }
    }
    
    private init() { }

     func updateToken(tokenString: String) {
        token = tokenString
    }
    
     func updateUser(userModel: User) {
        user = userModel
         if userModel.token != nil {
             authToken = userModel.token
         }
         saveUser(user: user!)
    }
    
    func logoutUser() {
        user = nil
        resetDefaults()
    }
    
    var isSession: Bool {
        return authToken != nil
    }
    
     func syncFCMToken() {
//        if let id = user?.id {
             var token = fcmToken
            if isSession && token.isNil {
                Messaging.messaging().token { token, error in
                  if let error = error {
                    print("Error fetching FCM registration token: \(error)")
                  } else if let token = token {
                    print("FCM registration token: \(token)")
                      self.token = token
                  }
                }
             } else {
              
             }
//         }
     }
    
    func saveUser(user: User) {
        do {
            let encoder = JSONEncoder()
            let defaults = UserDefaults.standard
            
            let user: User = user
            let encoded = try encoder.encode(user)
            defaults.set(encoded, forKey: UserDefaults.AppUserDefault.userProfile)
            
        } catch(let e) {
            print(e)
        }
        
    }
}

extension LoggedUserDetails {
    
    private func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
}
