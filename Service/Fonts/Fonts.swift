//
//  Fonts.swift
//  Super Interactive Hockey
//
//  Created by Hamza on 25/08/2022.
//

import Foundation
import UIKit

class Font {
    
    static func semiBold(_ size: Double = 16) -> UIFont {
        return UIFont(name: "Poppins-SemiBold", size: size * appConstant.heightRatio)!
    }

    static func medium(_ size: Double = 16) -> UIFont {
        return UIFont(name: "Poppins-Medium", size: size * appConstant.heightRatio)!
    }


    static func regular(_ size: Double = 16) -> UIFont{
        return UIFont(name: "Poppins-Regular", size: size * appConstant.heightRatio)!
    }

    static func bold(_ size: Double = 16) -> UIFont{
        return UIFont(name: "Poppins-Bold", size: size * appConstant.heightRatio)!
    }

    static func light(_ size: Double = 16) -> UIFont{
        return UIFont(name: "Poppins-Light", size: size * appConstant.heightRatio)!
    }

    static func itelic(_ size: Double = 16) -> UIFont{
        return UIFont(name: "Poppins-SemiBoldItalic", size: size * appConstant.heightRatio)!
    }
    

}
