//
//  Constants.swift
//  TheBeats
//
//  Created by MacBook Air on 6/18/22.
//

import UIKit

var scale = UIScreen.main.bounds.size.height/812.0
var scaleWidth = UIScreen.main.bounds.size.width/375

class Constants: NSObject {
    static func showCustomAlert(_ parrentController:UIViewController, alertType:ALERT_TYPE? = .FEEL_DELETE_TYPE, _ title:String? = "", message:String? = "") -> ConfirmAlertController {
        let confirmAlertController:ConfirmAlertController = ConfirmAlertController.loadFromNib()
        confirmAlertController.alertType = alertType!
        confirmAlertController.alertTitle = title!
        confirmAlertController.alertMessage = message!
        parrentController.view.window?.addSubview(confirmAlertController.view)
        parrentController.addChild(confirmAlertController)
        return confirmAlertController
    }
}

//struct appColor{
//    
//}

extension UIColor {
    static let primaryColor = UIColor(hexString: "316CFF")
    static let disabledButtonColor = UIColor(hexString: "E8E8E8")
    static let disabledButtonTitleColor = UIColor(hexString: "9D9D9D")

}

struct CustomAlert {
    static func alertShow(_ parrentController:UIViewController) {
        
        let confirmAlertController:ConfirmAlertController = ConfirmAlertController.loadFromNib()
        parrentController.view.window?.addSubview(confirmAlertController.view)
        parrentController.addChild(confirmAlertController)
        
        confirmAlertController.cancelCompletion  = { button in
            print("cancel button completion")
            confirmAlertController.view.removeFromSuperview()
        }
        
        confirmAlertController.confirmCompletion  = { confirmButton in
            print("cancel button completion")
            confirmAlertController.view.removeFromSuperview()
        }
    }
}

//MARK: - Add Custom Font

struct CustomInterFonts {
    static let InterBold = "Inter-Bold"
    static let InterExtraBold = "Inter-ExtraBold"
    static let InterSemiBold = "Inter-SemiBold"
    static let InterRegular = "Inter-Regular"
    static let InterMedium = "Inter-Medium"
}
