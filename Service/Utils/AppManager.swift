//
//  AppManager.swift
//  Loop
//
//  Created by mac 2019 on 2/13/22.
//

import Foundation
import UIKit

final class AppManager {
    static let shared = AppManager()
    private let userDefaults = UserDefaults.standard
    public var fcmToken: String?
    
    var userModel: UserModel?
    
    var shouldSearchNewCreatorLoad = false
    
    var isDarkMode: Bool {
        if let window = UIApplication.shared.windows.first {
            return window.traitCollection.userInterfaceStyle == .dark
        }
        return false
    }
    
    var traitCollection: UITraitCollection? {
        if let window = UIApplication.shared.windows.first {
            return window.traitCollection
        }
        return nil
    }
    
    init() {
        
    }
    
    func getAppVersion() -> String {
        return "ver.\(Bundle.main.formattedVersion)"
    }
    
    func getImageUrl(imagePath: String?) -> URL? {
        if imagePath != nil {
            return URL(string: imagePath!)
        }
        return nil
    }
    
}
