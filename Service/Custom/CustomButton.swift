//
//  CustomButton.swift
//  Service
//
//  Created by Hamza on 27/09/2022.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    var cornerRadius: Int = 20 {
        didSet {
            self.layer.cornerRadius = CGFloat(cornerRadius) * appConstant.heightRatio
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

       setup()
    }
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")/
        super.init(coder: coder)
        setup()
    }
    
    
    
    func setup(){
        self.layer.cornerRadius = 20 * appConstant.heightRatio
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 1 * appConstant.heightRatio
        self.layer.shadowOpacity = 0.20
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.setTitleColor(UIColor.black, for: .normal)
        self.contentMode = .scaleAspectFit
        self.clipsToBounds = false
        self.backgroundColor =  theme_color()
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1 * appConstant.heightRatio
    }
}
