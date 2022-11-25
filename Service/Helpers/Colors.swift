//
//  Colors.swift
//  Dircect calls
//
//  Created by Amman Mac 2 on 21/06/2022.
//

import Foundation
import UIKit

func theme_color()  -> UIColor {
    return UIColor.init(hex: "#FFBD30")
}

func theme_gray()  -> UIColor {
    return UIColor.init(hex: "#606060")
}

func theme_lightGray()  -> UIColor {
    return UIColor.init(hex: "#EEF0F5")
}

func tf_border()  -> UIColor {
    return UIColor.init(hex: "#EEF0FC")
}

func redText_color() -> UIColor {
    return UIColor.init(hex: "#FF0000")
}

func shadow_color() -> UIColor {
    return UIColor.init(hex: "#000000")
}

func unselected_color() -> UIColor {
    return UIColor.init(hex: "#DFDFDF")
}
func viewController_color() -> UIColor {
    return UIColor.init(hex: "#F9F9F9")
}


extension UIColor {
    public convenience init(hex:String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        if ((cString.count) == 8) {
            r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            g =  CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            b = CGFloat((rgbValue & 0x0000FF)) / 255.0
            a = CGFloat((rgbValue & 0xFF000000)  >> 24) / 255.0
        }else if ((cString.count) == 6){
            r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            g =  CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            b = CGFloat((rgbValue & 0x0000FF)) / 255.0
            a =  CGFloat(1.0)
        }
        
        self.init(  red: r,green: g,blue: b,alpha: a)
    }
}


extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
