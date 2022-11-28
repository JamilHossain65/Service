//
//  Label.swift
//  WallsPy
//
//  Created by Daniyal Shafiq on 20/04/2022.
//  Copyright © 2022 367 Labs. All rights reserved.
//

import UIKit
class Label: UILabel {
    
    var edgeInset: UIEdgeInsets = .zero
    
    required init(text: String = "", font: UIFont = UIFont.boldSystemFont(ofSize: 12), color: UIColor = UIColor.black, alignment: NSTextAlignment = .center, numberOfLines: Int = 0) {
        super.init(frame: .zero)
        super.translatesAutoresizingMaskIntoConstraints = false
        
        textColor = color
        self.text = text
        self.font = UIFont(name: (font.fontName), size: CGFloat(Int(font.pointSize)))
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: edgeInset.top, left: edgeInset.left, bottom: edgeInset.bottom, right: edgeInset.right)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + edgeInset.left + edgeInset.right, height: size.height + edgeInset.top + edgeInset.bottom)
    }
}
