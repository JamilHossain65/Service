//
//  ImageView.swift
//  WallsPy
//
//  Created by Daniyal Shafiq on 20/04/2022.
//  Copyright © 2022 367 Labs. All rights reserved.
//
import UIKit
class ImageView: UIImageView {
    
    required init(imageName: String = "dummy",cornerRadius: CGFloat = 0.0, backgroundColor: UIColor = .clear, contentMode: UIView.ContentMode = .scaleToFill, clipsToBound: Bool = true) {
        super.init(frame: .zero)
        super.translatesAutoresizingMaskIntoConstraints = false
        
        image = UIImage(named: imageName)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius * appConstant.heightRatio
        self.contentMode = contentMode
        self.clipsToBounds = clipsToBound
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
