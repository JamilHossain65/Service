//
//  StackView.swift
//  WallsPy
//
//  Created by Daniyal Shafiq on 30/04/2022.
//  Copyright © 2022 367 Labs. All rights reserved.
//

import Foundation
import UIKit


class StackView: UIStackView {
    
    required init(backgroundColor: UIColor = UIColor.clear, cornerRadius: CGFloat = 0, distribution: UIStackView.Distribution = .fillEqually, spacing: CGFloat = 0.0, axis: NSLayoutConstraint.Axis ) {
        super.init(frame: .zero)
        super.translatesAutoresizingMaskIntoConstraints = false
        self.spacing = spacing
        self.distribution = distribution
        self.backgroundColor = backgroundColor
        self.axis = axis
        self.layer.cornerRadius = cornerRadius
        self.alignment = .fill
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

