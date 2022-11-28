//
//  CircularButton.swift
//  TheBeats
//
//  Created by Bd Stock Air-M on 29/6/22.
//

import UIKit

class CircularButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width/2
    }
}
