//
//  MediaCVCell.swift
//  Service
//
//  Created by Hamza on 30/09/2022.
//

import Foundation
import UIKit

class MediaCVCell: UICollectionViewCell {
    
    lazy var bgView = View(backgroundColor: .clear)
    lazy var serviceImg = ImageView(imageName: "media_dummy_ic")
    
    static var identifier: String = "MediaCVCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        bgView.layer.cornerRadius = 20 * appConstant.heightRatio
        bgView.layer.shadowRadius = 1
        bgView.layer.shadowOpacity = 0.3
        bgView.layer.shadowColor = shadow_color().cgColor
        bgView.layer.shadowOffset = .init(width: 0, height: 0)
        bgView.layer.borderColor = tf_border().cgColor
        bgView.layer.borderWidth = 1 * appConstant.heightRatio
        bgView.clipsToBounds = true
        setupCell()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func setupCell(){
        contentView.addSubview(bgView)
        bgView.addSubview(serviceImg)
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4 * appConstant.heightRatio),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4 * appConstant.widthRatio),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4 * appConstant.widthRatio),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4 * appConstant.widthRatio),
            
            serviceImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0 * appConstant.heightRatio),
            serviceImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            serviceImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            serviceImg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0 * appConstant.widthRatio),
            
        ])
    }
    
}
