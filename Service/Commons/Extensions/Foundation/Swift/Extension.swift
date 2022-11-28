//
//  Extension.swift
//  Dryzzle
//
//  Created by Muhammad Salman Zafar on 4/26/20.
//  Copyright © 2020 Muhammad Salman Zafar. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer
import CommonCrypto
import WebKit

extension UIView {
    
    func applyShadow(radius: CGFloat, color: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2010729826), size: CGSize = .zero) {
        layer.cornerRadius = radius
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = size
        layer.shadowRadius = 11
        layer.bounds = bounds
        layer.position = center
        layer.masksToBounds = false
    }
    
    func addBorder(_ color: UIColor = .white, width: CGFloat = 1.0) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func applyShadow(shadowSize: CGFloat = 5, color: UIColor) {
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: self.frame.size.width + shadowSize,
                                                   height: self.frame.size.height + shadowSize))
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.name = "bottom-layer"
        self.layer.addSublayer(border)
    }
    
    func asImage() -> UIImage? {
        UIGraphicsBeginImageContext(frame.size)
        defer { UIGraphicsEndImageContext() }
        layer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        return image
    }
    
    func snapshot(scale: CGFloat = UIScreen.main.scale) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, self.isOpaque, scale)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    var rootVC: UINavigationController? {
        UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController as? UINavigationController
    }
    
}

extension UIViewController {
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
        
    }
    
    func presentAlertWithBackAction(title: String, message: String, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            completion()
        }))
        present(alert, animated: true)
    }
    
    func presentAlertWithAction(title: String, message: String, positive: String, negative: String, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: positive, style: .default, handler: { _ in
            completion()
        }))
        alert.addAction(UIAlertAction(title: negative, style: .cancel))
        present(alert, animated: true)
    }
    
    func presentAlertWithTextField(title: String, message: String, price: String = "", completion: @escaping (Double) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField {
            $0.placeholder = "Amount"
            $0.text = price
            $0.keyboardType = .decimalPad
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            let text = (alert.textFields?.first?.text ?? "").replaceCommaWithDot
            completion(Double(text) ?? -1)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
    
    
    func addLogoToNavigationBarItem(image: UIImage, height: CGFloat, constant: CGFloat = 0) {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = image

        // In order to center the title view image no matter what buttons there are, do not set the
        // image view as title view, because it doesn't work. If there is only one button, the image
        // will not be aligned. Instead, a content view is set as title view, then the image view is
        // added as child of the content view. Finally, using constraints the image view is aligned
        // inside its parent.
        let contentView = UIView()
        self.navigationItem.titleView = contentView
        self.navigationItem.titleView?.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: constant).isActive = true
        imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    func addLogoToCenter(image: UIImage, height: CGFloat) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: height, height: height))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    var rootvc: UINavigationController? {
        UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController as? UINavigationController
    }
    
    func showProgres(message: String = "Loading...") {
        DispatchQueue.main.async { Progress.shared.showActivity(myView: self.view, myTitle: message) }
    }
    
    func dissmisProgress() {
        DispatchQueue.main.async { Progress.shared.removeActivity(myView: self.view)}
    }
    
    func giveViewShadow(_ view: UIView) {
        view.layer.cornerRadius = 20 * appConstant.heightRatio
        view.layer.shadowRadius = 1
        view.layer.shadowOpacity = 0.3
        view.layer.shadowColor = shadow_color().cgColor
        view.layer.shadowOffset = .init(width: 0, height: 0)
    }
    
    func showErrorView(message: String) {
        ErrorView(contentView: navigationController?.view ?? view).show(message: message)
    }
    
    func setRootVC(_ vc: UIViewController) {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        vc.view.backgroundColor = .white
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}

extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
    
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
    
}

extension UIImageView {
    
    func loadImage(by url: URL) {
        do {
            image = UIImage(data: try Data(contentsOf: url))
        } catch let error {
            print("error => \(error.localizedDescription)")
        }
    }
    
    func addAspectRatioConstraint(constant: CGFloat = 0.0) {
        
        if let image = image {
            removeAspectRatioConstraint()
            let aspectRatio = image.size.width / image.size.height
            let constraint = NSLayoutConstraint(item: self, attribute: .width,
                                                relatedBy: .equal,
                                                toItem: self, attribute: .height,
                                                multiplier: aspectRatio, constant: constant)
            addConstraint(constraint)
        }
    }
    
    
    func removeAspectRatioConstraint() {
        for constraint in self.constraints {
            if (constraint.firstItem as? UIImageView) == self,
               (constraint.secondItem as? UIImageView) == self {
                removeConstraint(constraint)
            }
        }
    }
    
    func shadowLayer(frame: CGRect, top: Bool = true) {
        let layer = CAGradientLayer()
        layer.colors = top ? [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor, UIColor.clear] : [UIColor.clear, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor]
        layer.frame = frame
        layer.name = "shadow"
        self.layer.addSublayer(layer)
    }
}

extension Date {
    
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds: Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    var wholeDayCovered: Bool {
        return Int(Date().timeIntervalSince(self) / 3600) > 24
    }
    
    var seconds: Int {
        let calendar = Calendar.current
        let com = calendar.dateComponents([.second], from: self, to: Date())
        return com.second ?? 0
    }
    
    var daysLeft: Int {
        return Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? -1
    }
    
    var formatDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy, HH:mm:ss"
        return formatter.string(from: self)
    }
    
    var formatOnlyDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: self)
    }
    
    var apiFormatDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
    var dobFormatDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: self)
    }
    
    var peramsFormmate: String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: self)
    }
    
    var formatDateMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: self)
    }
    
    var dayName: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        return formatter.string(from: self).uppercased()
    }
    
    var toSeconds: Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH-mm-ss"
        let times = formatter.string(from: self).components(separatedBy: "-").compactMap({ Int($0) })
        return (times[0]) * 60 * 60 + (times[1]) * 60 + (times[2])
    }
    
    var startOfMonth: Date {
        Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    var endOfMonth: Date {
        Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth)!
    }
    
    var isSunday: Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        return formatter.string(from: self).lowercased() == "sun"
    }
}

extension UILabel {
    
    func textDropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
    }
    
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin,
                                         attributes: [.font: font ?? UIFont(name: "Avenir-Book", size: 17)! ], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
}

extension Double {
    
    private var formatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter
    }
    
    func secondsToString() -> String {
        return formatter.string(from: self) ?? ""
    }
    
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
    
    var formattedNumber: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.locale = .current
        return formatter.string(from: NSNumber(value: self)) ?? String(rounded(toPlaces: 2))
    }
    
}

extension Int {

    func formatUsingAbbrevation() -> String {
        let numFormatter = NumberFormatter()
        
        typealias Abbrevation = (threshold:Double, divisor:Double, suffix:String)
        let abbreviations:[Abbrevation] = [(0, 1, ""),
                                           (1000.0, 1000.0, "K"),
                                           (100_000.0, 1_000_000.0, "M"),
                                           (100_000_000.0, 1_000_000_000.0, "B")]

        let startValue = Double (abs(self))
        let abbreviation:Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        } ()

        let value = Double(self) / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 2
        
        return numFormatter.string(from: NSNumber (value:value))!
    }

}


extension URL {
    
    func getImage() -> UIImage? {
        do {
            return UIImage(data: try Data(contentsOf: self))
        } catch let error {
            print("error => \(error.localizedDescription)")
        }
        
        return nil
    }
    
}


extension CharacterSet {
    public static var quotes = CharacterSet(charactersIn: "\"'")
}

extension String {
    
    public func emptyToNil() -> String? {
        return self == "" ? nil : self
    }
    
    public func blankToNil() -> String? {
        return self.trimmingCharacters(in: .whitespacesAndNewlines) == "" ? nil : self
    }
    
    public func convertToTimestamp() -> TimeInterval? {

        let times = split(separator: ":").compactMap({ TimeInterval($0) })
        if times.isEmpty && times.count > 3 { return nil}
        
        if times.count == 3 { return (times[0] * 3600) + (times[1] * 60) + times[0] }
        else if times.count == 2 { return (times[0] * 60) + times[1] }
        else { return times[0] }
        
    }
    
    var downloadPath: String {
        guard let url = URL(string: self) else { return self }
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsPath.appendingPathComponent(url.lastPathComponent).path
    }
    
    var emojiLess: String {
        return String(self.filter { !$0.isEmoji() }).trimmingCharacters(in: .whitespaces)
    }
    
    var formatDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let date = formatter.date(from: self) ?? Date()
        return date.formatOnlyDate
    }
    
    var trim: String { trimmingCharacters(in: .whitespaces) }
    
    var toSeconds: Int {
        let times = self.components(separatedBy: ":").compactMap({ Int($0) })
        return (times[0]) * 60 * 60 + (times[1]) * 60 + (times[2])
    }
    
    var md5: String {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        var digest = [UInt8](repeating: 0, count: length)
        if let d = self.data(using: String.Encoding.utf8) {
            _ = d.withUnsafeBytes { (body: UnsafePointer<UInt8>) in
                CC_MD5(body, CC_LONG(d.count), &digest)
            }
        }
        return (0..<length).reduce("") {
            $0 + String(format: "%02x", digest[$1])
        }
    }
    
    var isoToDate: Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        return dateFormatter.date(from: self)?.millisecondsSince1970 ?? 0
    }
    
    var replaceCommaWithDot: String {
        replacingOccurrences(of: ",", with: ".")
    }
    
    var localized: String {
        
        let resource = UserDefaults.standard.string(forKey: UserDefaults.AppUserDefault.appLanguage)
        let path = Bundle.main.path(forResource: resource , ofType: "lproj")
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
    public func validateEmail() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailTest.evaluate(with: self)
    }
    
    var convertEpochIntoDate: String {
        let epocTime = TimeInterval(Double(self) ?? 000)
        let myDate = Date(timeIntervalSince1970: epocTime)
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d HH:mm"
        formatter.timeZone = .current
        return formatter.string(from: myDate)
    }

    var convertIntoDate: String {
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let myDate = formatter1.date(from: self) ?? Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d HH:mm"
        formatter.timeZone = .current
        return formatter.string(from: myDate)
    }

}

extension Character {
    fileprivate func isEmoji() -> Bool {
      return Character(UnicodeScalar(UInt32(0x1d000))!) <= self && self <= Character(UnicodeScalar(UInt32(0x1f77f))!)
        || Character(UnicodeScalar(UInt32(0x2100))!) <= self && self <= Character(UnicodeScalar(UInt32(0x26ff))!)
    }
}

extension MPVolumeView {
    static func setVolume(_ volume: Float) {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
