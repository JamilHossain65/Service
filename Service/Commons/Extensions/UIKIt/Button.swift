//
//  Button.swift
//  WallsPy
//
//  Created by Daniyal Shafiq on 20/04/2022.
//  Copyright © 2022 367 Labs. All rights reserved.
//

import Foundation
import UIKit
class Button: UIButton {
    
    required init(imageName: String = "", text: String = "", font: UIFont =  Font.semiBold(12), backgroundColor: UIColor = .clear, textColor: UIColor = theme_gray(), cornerRadius: CGFloat = 0.0,  imageTintColor: UIColor = .clear, tag: Int = 0 ) {
        super.init(frame: .zero)
        super.translatesAutoresizingMaskIntoConstraints = false
        
        setTitle(text, for: .normal)
        titleLabel?.font = UIFont(name: (font.fontName), size: CGFloat(font.pointSize * appConstant.heightRatio))
        layer.cornerRadius = cornerRadius * appConstant.heightRatio
        self.backgroundColor = backgroundColor
        self.tag = tag
        setTitleColor(textColor, for: .normal)
        if imageName.isEmpty == false {
            self.setImage(UIImage(named: imageName), for: .normal)
//            self.imageView?.tintColor = imageTintColor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class LoginButtonView: UIView {
    
    let topContainerView = View()
    
    private lazy var backView: View = View(backgroundColor: .clear)
    
    lazy var iconView: ImageView = ImageView(imageName: "avatar")
    
    let optionNameLabel: Label = {
        let label = Label(text: "Name",font: Font.regular(18),color: UIColor.black,alignment: .left)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let accessoryView: ImageView = ImageView(imageName: "accessory_indicator")
    
    var didTapOnOption: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        accessoryView.image = UIImage(named: "accessory_indicator")?.withRenderingMode(.alwaysTemplate)
        accessoryView.tintColor = UIColor.black
        iconView.contentMode = .center
        setupViews()
    }
    
    init(imageName: String, title: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = UIImage(named: imageName)
        optionNameLabel.text = title
        setupViews()
        topContainerView.layer.cornerRadius = 30 * appConstant.heightRatio
        let viewTap = UITapGestureRecognizer(target: self, action: #selector(didTap(tapGestureRecognizer:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(viewTap)
    }
    
    @objc func didTap(tapGestureRecognizer: UITapGestureRecognizer) {
        self.didTapOnOption?()
    }
    
    func setupViews() {
        
        self.addSubview(topContainerView)
        topContainerView.addSubview(iconView)
        topContainerView.addSubview(optionNameLabel)
        topContainerView.addSubview(backView)
        backView.addSubview(accessoryView)
        
        NSLayoutConstraint.activate([
            
            topContainerView.topAnchor.constraint(equalTo: self.topAnchor),
            topContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            topContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
            iconView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor,constant: 35 * appConstant.widthRatio),
            iconView.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            iconView.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),
            
//            optionNameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10.autoSized),
//            optionNameLabel.trailingAnchor.constraint(equalTo: backView.leadingAnchor, constant: -10.autoSized),
            optionNameLabel.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor),
            optionNameLabel.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
//            optionNameLabel.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: -35.autoSized),
            
            backView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor),
            backView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor,constant: -22 * appConstant.widthRatio),
            backView.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            backView.widthAnchor.constraint(equalToConstant: 24 * appConstant.widthRatio),
            
            accessoryView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            accessoryView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
        ])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

