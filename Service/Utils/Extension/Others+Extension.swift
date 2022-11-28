//
//  Others+Extension.swift
//  Loop
//
//  Created by mac 2019 on 3/2/22.
//

import Foundation
import UIKit
import Photos

extension Bundle {
    var versionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    var formattedVersion: String {
        return "\(versionNumber ?? "1.0")"
    }
}

extension UISwitch {
    func setScale(width: CGFloat, height: CGFloat) {
        
        let standardHeight: CGFloat = 31
        let standardWidth: CGFloat = 51
        let heightRatio = height / standardHeight
        let widthRatio = width / standardWidth

        transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
}

extension PHAsset {
    var primaryResource: PHAssetResource? {
        let types: Set<PHAssetResourceType>

        switch mediaType {
        case .video:
            types = [.video, .fullSizeVideo]
        case .image:
            types = [.photo, .fullSizePhoto]
        case .audio:
            types = [.audio]
        case .unknown:
            types = []
        @unknown default:
            types = []
        }

        let resources = PHAssetResource.assetResources(for: self)
        let resource = resources.first { types.contains($0.type)}

        return resource ?? resources.first
    }

    var originalFilename: String {
        guard let result = primaryResource else {
            return "file"
        }

        return result.originalFilename
    }
}

extension String {
    func toString(format: String) -> String? {
        let dateString = self.toDate(format: "yyyy-MM-dd hh:mm:ss") //yyyy_MM_dd_hh_mm_ss
        let formatedDate = dateString?.toString(format: yyyy_MM_dd)
        return formatedDate
    }
}

extension Date {
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
    
    func toFormat(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)
        return dateFormatter.date(from: str)
    }
    
    func minutesBetween(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: startDate, to: endDate)

        return components.minute ?? 0
    }
    
    func hoursBetween(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour], from: startDate, to: endDate)

        return components.hour ?? 0
    }
    
    func daysBetween(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)

        return components.day ?? 0
    }
    
    func monthsBetween(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: startDate, to: endDate)

        return components.month ?? 0
    }
    
    func yearsBetween(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: startDate, to: endDate)

        return components.year ?? 0
    }
    
    func toUTC(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)
        return dateFormatter.date(from: str)
    }
}

extension UserDefaults {
    func isExist(key: String) -> Bool {
        return self.object(forKey: key) != nil
    }
}

extension URL {
    func valueOf(_ queryParameterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParameterName })?.value
    }
}

extension Notification.Name {
    static let themeChangedNotification = Notification.Name("themeChangedNotification")
    static let profileChangedNotification = Notification.Name("profileChangedNotification")
    static let notiBadgeCangedChangedNotification = Notification.Name("notiBadgeChangedNotification")
}

public extension UINavigationController {

    /**
     Pop current view controller to previous view controller.

     - parameter type:     transition animation type.
     - parameter duration: transition animation duration.
     */
    func pop(transitionType: CATransitionType, subType: CATransitionSubtype, duration: CFTimeInterval = 0.3) {
        self.addTransition(transitionType: transitionType, subType: subType, duration: duration)
        self.popViewController(animated: false)
    }

    /**
     Push a new view controller on the view controllers's stack.

     - parameter vc:       view controller to push.
     - parameter type:     transition animation type.
     - parameter duration: transition animation duration.
     */
    func push(viewController vc: UIViewController, transitionType: CATransitionType, subType: CATransitionSubtype, duration: CFTimeInterval = 0.3) {
        self.addTransition(transitionType: transitionType, subType: subType, duration: duration)
        self.pushViewController(vc, animated: false)
    }

    private func addTransition(transitionType: CATransitionType, subType: CATransitionSubtype, duration: CFTimeInterval = 0.3) {
        let transition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = transitionType
        transition.subtype = subType
        self.view.layer.add(transition, forKey: nil)
    }

}
