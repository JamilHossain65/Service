//
//  NHConstants.swift
//  Loop
//
//  Created by mac 2019 on 2/10/22.
//

import Foundation
import UIKit

struct AppConstants {
    static let globeClickEventKey = "clicked_post_id"
    static let globeZoomEventKey = "zoom_in_action_center"
}

struct Defaults {
    static func savePost(_ isCheck:Bool) {
        UserDefaults.standard.set(isCheck, forKey: "FIRST_POST_CHECK")
        UserDefaults.standard.synchronize()
    }
    
    static func hasPost() -> Bool{
       return UserDefaults.standard.bool(forKey: "FIRST_POST_CHECK")
    }
}

struct AppFonts {
    
    static func HiraginoSansW3(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "HiraginoSans-W3", size: ofSize)!
    }
    
    static func HiraginoSansW6(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "HiraginoSans-W6", size: ofSize)!
    }
    
    static func HiraginoSansW7(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "HiraginoSans-W7", size: ofSize)!
    }
    
    static func BarlowMedium(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Barlow-Medium", size: ofSize)!
    }
    
}

struct AppColors {
    static let bgColors    = [UIColor("#80A6F1"),
                              UIColor("#EAB886"),
                              UIColor("#B978E4"),
                              UIColor("#85D7A6"),
                              UIColor("#77C8CF"),
                              UIColor("#DE6F67"),]
    
    static let white = UIColor(rgb: 0xFFFFFF)
    static let transparent = UIColor.clear
    static let red = UIColor(red: 255.0/255.0, green: 0.0, blue: 0.0, alpha: 1.0)
    static let gray = UIColor.gray
    static let blueText = UIColor("#3385FF")
    static let grayText = UIColor("#BBBBBB")
    static let grayText33 = UIColor("#333333")
    static let grayText95 = UIColor("#959595")
    static let gray9d = UIColor("#9D9D9D")
    static let graye8 = UIColor("#E8E8E8")
    static let grayc4 = UIColor("#C4C4C4")
    
    static let blue         = UIColor("#316CFF")
    static let placeholder  = UIColor("#CECECE")
    
    static let black = UIColor.black
    static let green = UIColor.green
    static let background = UIColor(named: "Background") ?? UIColor.clear
}

enum AppTexts: String {
    // Jamil translate_id_0001 - translate_id_1000
    case translate_id_0001
    case translate_id_0009
    case translate_id_0010
    case translate_id_0011
    case translate_id_0029
    case translate_id_1052
}

enum AppImages: String {
    // Login
    case logo = "Logo"
    case arrowBack = "ArrowBack"
    case backBlack = "back"
    case combinedLogo = "CombinedLogo"
    case appBG = "AppBG"
}

struct APIConstants {
    static let bearerKey = "Authorization"
    static let webviewUrl = "https://ikigai-dev.kjcommons.com/beats/"
    static let baseUrl = "https://dev.thebeats.app/"
}

struct DateFormatConstants {
    static let yyyy_MM_dd_T_HH_mm_ss_mmm_z = "yyyy-MM-dd'T'HH:mm:ss.mmmZ"
    static let yyyy_MM_dd_T_HH_mm_ss_z = "yyyy-MM-dd'T'HH:mm:ssZ"
    static let yyyy_MM_dd_HH_mm_ss = "yyyy-MM-dd HH:mm:ss"
    static let dd_MMM_yyyy = "dd MMM yyyy"
    static let MMM_dd_yyyy = "MMM dd, yyyy"
    static let yyyy_mm_dd = "yyyy-MM-dd"
    static let yyyy = "yyyy"
    static let dd_mmm = "dd MMM"
    static let hh_mm_a = "hh:mm a"
}
