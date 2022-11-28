//
//  Extensions.swift
//  TheBeats
//
//  Created by MacBook Air on 6/9/22.
//

import UIKit
import Photos
import SnapKit

let isDevelopment = true

class Extensions: NSObject {

}

extension UIViewController {
    
    func setWhiteBack() {//chevron.left
        let backBtn = UIView.createButton(title: "")
        backBtn.setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
        backBtn.tintColor = AppColors.white
        backBtn.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        self.view.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.leading.equalTo(self.view.snp.leading).offset(20.s)
            make.top.equalTo(self.view.snp.top).offset(SizeConfig.padding.top + 22.s)
        }
    }
    
    func setBackButton(hide:Bool? = false){
        
        let backImage = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonPressed))
        
        if Int(UIScreen.main.bounds.width) == 375 && Int(UIScreen.main.bounds.height) == 812 {
            self.navigationItem.leftBarButtonItem!.imageInsets = UIEdgeInsets(top: -10, left: 10, bottom: 0, right: 0)
        }
        
        if let _hide = hide,_hide == true {
            // remove left buttons (in case you added some)
            self.navigationItem.leftBarButtonItems = []
            // hide the default back buttons
            self.navigationItem.hidesBackButton = true
        }else{
            //            // remove left buttons (in case you added some)
            //             self.navigationItem.leftBarButtonItems = []
            //            // hide the default back buttons
            //self.navigationItem.hidesBackButton = false
        }
    }
    
    @objc func backButtonPressed(){
        print("back...")
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
    }
    
    func showAlert(title:String?, message:String){
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        present(alert, animated: true, completion: nil)
    }
    
    var topbarHeight: CGFloat {
        return SizeConfig.padding.top
    }
    
}

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}

extension UIFont {
    //call this way
    //let font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(500))
  func withWeight(_ weight: UIFont.Weight) -> UIFont {
    let newDescriptor = fontDescriptor.addingAttributes([.traits: [
      UIFontDescriptor.TraitKey.weight: weight]
    ])
    return UIFont(descriptor: newDescriptor, size: pointSize)
  }
}

extension UIFont {
    func hiraginoSansW3(_ size:CGFloat) -> UIFont{
        return UIFont(name: "HiraginoSans-W3", size: size)!
    }
    
    func hiraginoSansW7(_ size:CGFloat) -> UIFont{
        return UIFont(name: "HiraginoSans-W7", size: size)!
    }
}

extension UILabel {
    func setLetterSpacingBy(value: Double) {
        if let textString = self.text,textString.count > 0 {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
    func setLineHeight(value:Double){
        if let _text = text {
            let paragraphStyle = NSMutableParagraphStyle()
            //line height size
            paragraphStyle.lineSpacing = value
            let attrString = NSMutableAttributedString(string: _text)
            attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
            attributedText = attrString
        }
    }
}

extension UITextField {
    func leftPadding(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func rightPadding(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    // set icon of 20x20 with left padding of 8px
    func setLeftIcon(_ icon: UIImage, gap:CGFloat? = 10.s) {
        
        let padding = CGFloat(14.s)
        let width = icon.size.width
        //CGRect(x: 0, y: 0, width: size + padding + Int gap, height: size)
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: width + padding + gap!, height: width))
        let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: width, height: width))
        iconView.image = icon
        outerView.addSubview(iconView)
        
        leftView = outerView
        leftViewMode = .always
    }
    
    func enablePasswordToggle(whiteBG: Bool = false) {
        let button = UIButton(type: .custom)
        button.tag = whiteBG ? 5 : 10
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -0.s, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 20.s), y: CGFloat(5.s), width: CGFloat(20.s), height: CGFloat(20.s))
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    
    @objc private func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
    
    private func setPasswordToggleImage(_ button: UIButton) {
        if isSecureTextEntry {
            if button.tag == 5 {
                button.setImage(UIImage(named: "eye_on_gray"), for: .normal)
            } else {
                button.setImage(UIImage(named: "eye_on_white"), for: .normal)
            }
        } else{
            if button.tag == 5 {
                button.setImage(UIImage(named: "eye_off_gray"), for: .normal)
            } else {
                button.setImage(UIImage(named: "eye_off_gray"), for: .normal)
            }
        }
    }
    
    func addBottomBorder(borderColor: UIColor = .lightGray) {
        let bottomLine = UIView()
        bottomLine.backgroundColor = borderColor
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .none
        self.addSubview(bottomLine)
        
        NSLayoutConstraint.activate([
            bottomLine.topAnchor.constraint(equalTo: bottomAnchor, constant: 2),
            bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

extension UITextField {
    func setLetterSpacingBy(value: Double) {
//    if let textString = self.text {
//      let attributedString = NSMutableAttributedString(string: textString)
//        attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
//      attributedText = attributedString
//    }
        if let textString = self.placeholder {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: NSRange(location: 0, length: attributedString.length))
            attributedPlaceholder = attributedString
        }
        
  }
}

extension UITextView {
    func setLetterSpacingBy(value: Double) {
    if let textString = self.text {
      let attributedString = NSMutableAttributedString(string: textString)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
      attributedText = attributedString
    }
  }
}

extension UITextView{

    func setPlaceholder(_ text:String? = "Enter some text...", mFrame:CGRect? = CGRect(x: 8.s, y:8.s, width: 200.s, height: 32.s), spacing:Double? = 1.0, height:Double? = 1.0, font:UIFont? = AppFonts.HiraginoSansW3(ofSize: 15.sp)) {
        self.viewWithTag(222)?.removeFromSuperview()
        let placeholderLabel = UILabel()
        placeholderLabel.text = text
        placeholderLabel.font = font!
        //UIFont.italicSystemFont(ofSize: 15)
        placeholderLabel.setLetterSpacingBy(value: spacing!)
        placeholderLabel.setLineHeight(lineHeight: height!)
        placeholderLabel.tag = 222
        placeholderLabel.frame = mFrame!
        placeholderLabel.numberOfLines = 0
        placeholderLabel.textColor = AppColors.placeholder
        placeholderLabel.isHidden = !self.text.isEmpty
        self.addSubview(placeholderLabel)
    }

    func checkPlaceholder() {
        guard let placeholderLabel = self.viewWithTag(tag + 222) as? UILabel else { return }
        placeholderLabel.isHidden = !self.text.isEmpty
    }
    
    func hidePlaceholder(_ isHide: Bool) {
        guard let placeholderLabel = self.viewWithTag(tag + 222) as? UILabel else{ return }
        placeholderLabel.isHidden = isHide
    }

}

extension CGFloat {
    func scale() -> CGFloat  {
        return UIScreen.main.bounds.size.height * CGFloat(self) / 812.0
    }
}

extension Int {
    var scaleW:CGFloat {
        get {
            return UIScreen.main.bounds.size.height * CGFloat(self) / 375.0
        }
    }
    
    var scaleH:CGFloat {
        get {
            return UIScreen.main.bounds.size.height * CGFloat(self) / 812.0
        }
    }
    
    func scale() -> CGFloat  {
        return UIScreen.main.bounds.size.height * CGFloat(self) / 812.0
    }
}

extension Int {
    func string() -> String  {
        return String(self)
    }
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

extension String {
    func read() -> String {
        if let url = Bundle.main.url(forResource: self, withExtension: nil){
            //reading
            do {
                let text = try String(contentsOf: url, encoding: .utf8)
                return text
            }
            catch {print("Error:: Cant read file \(self)")}
        }
        
        return ""
    }
    
    func write(){
        let file = "file.txt" //this is the file. we will write to and read from it

        let text = "some text" //just a text

        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent(file)

            //writing
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}

            //reading
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
    }
}

extension UITapGestureRecognizer {
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
            
            let layoutManager = NSLayoutManager()
            let textContainer = NSTextContainer(size: CGSize.zero)
            let textStorage = NSTextStorage(attributedString: label.attributedText!)
            
            layoutManager.addTextContainer(textContainer)
            textStorage.addLayoutManager(layoutManager)
            
            textContainer.lineFragmentPadding = 0.0
            textContainer.lineBreakMode = label.lineBreakMode
            textContainer.maximumNumberOfLines = label.numberOfLines
            let labelSize = label.bounds.size
            textContainer.size = labelSize
            
            let locationOfTouchInLabel = self.location(in: label)
            let textBoundingBox = layoutManager.usedRect(for: textContainer)
            let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                              y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
            let locationOfTouchInTextContainer = CGPoint(x: (locationOfTouchInLabel.x - textContainerOffset.x),
                                                         y: 0 );
            
            let lineModifier = Int(ceil(locationOfTouchInLabel.y / label.font.lineHeight)) - 1
            let rightMostFirstLinePoint = CGPoint(x: labelSize.width, y: 0)
            let charsPerLine = layoutManager.characterIndex(for: rightMostFirstLinePoint, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
            
            let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
            let adjustedRange = indexOfCharacter + (lineModifier * charsPerLine)
            
            return NSLocationInRange(adjustedRange, targetRange)
        }
}

extension Range where Bound == String.Index {
    var nsRange: NSRange {
        return NSRange(location: self.lowerBound.encodedOffset,
                       length: self.upperBound.encodedOffset -
                        self.lowerBound.encodedOffset)
    }
}

extension UIViewController {

    @discardableResult
    func showAlert(title: String? = "", message: String?, buttonTitles: [String]? = nil, highlightedButtonIndex: Int? = nil, completion: ((Int) -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var allButtons = buttonTitles ?? [String]()
        if allButtons.isEmpty {
            allButtons.append("OK")
        }

        for index in 0..<allButtons.count {
            let buttonTitle = allButtons[index]
            let action = UIAlertAction(title: buttonTitle, style: .default, handler: { (_) in
                completion?(index)
            })
            alertController.addAction(action)
            if let highlightedButtonIndex = highlightedButtonIndex, index == highlightedButtonIndex {
                if #available(iOS 9.0, *) {
                    alertController.preferredAction = action
                }
            }
        }
        present(alertController, animated: true, completion: nil)
        return alertController
    }

    @discardableResult
    func alert(error: Error, completion: ((Int) -> Void)? = nil) -> UIAlertController {
        return showAlert(
            message: error.localizedDescription,
            buttonTitles: ["OK"],
            completion: completion
        )
    }
    
    @discardableResult
    func alert(error: String, completion: ((Int) -> Void)? = nil) -> UIAlertController {
        return showAlert(
            message: error,
            buttonTitles: ["OK"],
            completion: completion
        )
    }
}

extension UIImageView {
    func fetchImageAsset(_ asset: PHAsset?, targetSize size: CGSize, contentMode: PHImageContentMode = .aspectFill, options: PHImageRequestOptions? = nil, completionHandler: ((Bool, UIImage?) -> Void)?) {
        
        guard let asset = asset else {
            completionHandler?(false, nil)
            return
        }
        
        let resulthandler: (UIImage?, [AnyHashable: Any]?) -> Void = {[weak self] image, info in
            self?.image = image
            completionHandler?(true, image)
        }
        
        PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: contentMode, options: options, resultHandler: resulthandler)
    }
}

extension UIView {
    func fetchImageAsset(imageView: UIImageView?, _ asset: PHAsset?, targetSize size: CGSize, contentMode: PHImageContentMode = .aspectFill, options: PHImageRequestOptions? = nil, completionHandler: ((Bool, UIImage?) -> Void)?) {
        
        guard let asset = asset else {
            completionHandler?(false, nil)
            return
        }
        
        let resulthandler: (UIImage?, [AnyHashable: Any]?) -> Void = { image, info in
            imageView?.image = image
            completionHandler?(true, image)
        }
        
        DispatchQueue.main.async {
            PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: contentMode, options: options, resultHandler: resulthandler)
        }
    }
}

extension UIScrollView {
    var isBottomBouncing: Bool {
        return contentOffset.y > 0.0
    }
    
    var isTopBouncing: Bool {
        return contentOffset.y <= 0.0
    }
}
