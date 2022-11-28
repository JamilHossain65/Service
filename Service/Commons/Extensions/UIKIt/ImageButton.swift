//
//  ImageButton.swift
//  WallsPy
//
//  Created by Daniyal Shafiq on 03/05/2022.
//  Copyright © 2022 367 Labs. All rights reserved.
//

import UIKit
class ImageButton: UIView {
    let mainView = View(backgroundColor: .clear, cornerRadius: 0)
    let imageView = ImageView(imageName: "back",backgroundColor: .clear)
    
    var didTapButton: ((Int) -> ())?
    
    required init(imageName: String, tag: Int = 0) {
        super.init(frame: .zero)
        self.tag = tag
        
        imageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .black
        
    
        translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = .black.withAlphaComponent(0.2)
        layer.cornerRadius = 20 * appConstant.heightRatio
        self.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio).isActive = true
        self.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio).isActive = true
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        addGestureRecognizer(tap)

        
        setupViews()
    }
    
    func setupViews() {
        addSubview(mainView)
        mainView.addSubview(imageView)
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainView.topAnchor.constraint(equalTo: self.topAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            imageView.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
        ])
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.didTapButton?(self.tag)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
