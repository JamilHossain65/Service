//
//  ProfileList.swift
//  Service
//
//  Created by Hamza on 02/10/2022.
//

import Foundation
import UIKit

enum ProfileList: String, CaseIterable {

    case productOrder  = "Product Order"
    case serviceOrder = "Service Order"
    case savedAddress = "Saved Address"
    case editProfile = "Edit Profile"
    case pushNotification  = "Push Notifications"
    case chat = "Chat"
    case language = "Language"
    case terms  = "Terms and Condition"
    case aboutUs  = "About us"
    case contactUs   = "Contact Us"
    case logout = "Logout"
    
    var image: UIImage {
        switch self {
        case .productOrder:
            return UIImage(named: "userProfile_ic")!
        case .serviceOrder:
            return UIImage(named: "lock_ic")!
        case .savedAddress:
            return UIImage(named: "location_ic")!
        case .editProfile:
            return UIImage(named: "editProfile_ic")!
        case .pushNotification:
            return UIImage(named: "notification_ic")!
        case .chat:
            return UIImage(named: "chat_ic")!
        case .language:
            return UIImage(named: "language_ic")!
        case .terms:
            return UIImage(named: "terms_ic")!
        case .aboutUs:
            return UIImage(named: "aboutUs_ic")!
        case .contactUs:
            return UIImage(named: "phone_call_outgoing_ic")!
        case .logout:
            return UIImage(named: "lock_ic")!
        }
    }
}
