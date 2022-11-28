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
    
    /*
    func setUserModel(_userModel: UserModel?, token: String?) {
        AppManager.shared.userModel = _userModel
        setAuthorizationToken(token: token)
    }
    
    func setAuthorizationToken(token: String?) {
        userDefaults.set(token, forKey: AppConstants.kUserDefaultSecreteTokenKey)
    }
    
    func getAuthorizationToken() -> String? {
        return userDefaults.string(forKey: AppConstants.kUserDefaultSecreteTokenKey)
    }
    
    func setPassword(password: String?) {
        userDefaults.set(password, forKey: AppConstants.kUserDefaultPasswordKey)
    }
    
    func getPassword() -> String? {
        return userDefaults.string(forKey: AppConstants.kUserDefaultPasswordKey)
    }
    
    func setMusicLevel(musicLevel: Float?) {
        userDefaults.set(musicLevel, forKey: AppConstants.kUserDefaultMusicKey)
    }
    
    func getMusicLevel() -> Float? {
        return userDefaults.object(forKey: AppConstants.kUserDefaultMusicKey) as? Float
    }
    
    func setSoundLevel(soundLevel: Float?) {
        userDefaults.set(soundLevel, forKey: AppConstants.kUserDefaultSounddKey)
    }
    
    func getSoundLevel() -> Float? {
        return userDefaults.object(forKey: AppConstants.kUserDefaultSounddKey) as? Float
    }
    
    func setVibration(isEnabled: Bool?) {
        userDefaults.set(isEnabled, forKey: AppConstants.kUserDefaultVibrationKey)
    }
    
    func getVibration() -> Bool {
        return userDefaults.bool(forKey: AppConstants.kUserDefaultVibrationKey)
    }
    
    func setRemember(isRemember: Bool?) {
        userDefaults.set(isRemember, forKey: AppConstants.kUserDefaultRememberKey)
    }
    
    func isRemember() -> Bool? {
        return userDefaults.bool(forKey: AppConstants.kUserDefaultRememberKey)
    }
    
    func setLanguage(lang: String) {
        userDefaults.set(lang, forKey: AppConstants.kUserDefaultLanguageKey)
    }
    
    func getLanguage() -> String {
        return userDefaults.string(forKey: AppConstants.kUserDefaultLanguageKey) ?? Locale.current.languageCode ?? "en"
    }
    
    func saveDarkMode(isDark: Bool) {
        userDefaults.set(isDark, forKey: AppConstants.kUserDefaultDarkModeKey)
    }
    
    func getSavedDarkMode() -> Bool? {
        let isExist = userDefaults.isExist(key: AppConstants.kUserDefaultDarkModeKey)
        return isExist ? userDefaults.bool(forKey: AppConstants.kUserDefaultDarkModeKey) : nil
    }
    
    func setOnboardShow(isShow: Bool?) {
        userDefaults.set(isShow, forKey: AppConstants.kUserDefaultOnboardShowKey)
    }
    
    func getOnboardShow() -> Bool? {
        return userDefaults.bool(forKey: AppConstants.kUserDefaultOnboardShowKey)
    }
    */
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
