//
//  KeyboardManager.swift
//  TheBeats
//
//  Created by MacBook Air on 7/18/22.
//

import UIKit

class KeyboardManager: NSObject {
    static let shared = KeyboardManager()
    var keyboardHeight = 336.0
    var completion : ((_ height: CGFloat) -> ())?
    
    func Observer() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
            print("keyboardheight:: \(keyboardHeight)")
            completion?(keyboardHeight)
        }
    }
}
