//
//  CompnyShopCVCell.swift
//  Service
//
//  Created by Hamza on 29/09/2022.
//

import Foundation
import UIKit

class CompnyShopCVCell: UICollectionViewCell {
    
    lazy var bgView = View(backgroundColor: .white)
    lazy var imgView = View(backgroundColor: .white)
    lazy var serviceImg = ImageView(imageName: "compny_dummy_ic", contentMode: .scaleAspectFill)
    lazy var serviceLbl = Label(text: "Eufy X8 Hybrid Robot Vacuum (T2261K11)", font: Font.medium(10), color: theme_gray(), alignment: .left, numberOfLines: 2)
    lazy var priceLbl = Label(text: "199.000 KD", font: Font.semiBold(12), color: .black, alignment: .left)
    
    static var identifier: String = "ServiceCVCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 20 * appConstant.heightRatio
        giveViewShadow(bgView)
        giveViewShadow(imgView)
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
        bgView.addSubview(imgView)
        imgView.addSubview(serviceImg)
        bgView.addSubview(serviceLbl)
        bgView.addSubview(priceLbl)
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4 * appConstant.heightRatio),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4 * appConstant.widthRatio),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4 * appConstant.widthRatio),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4 * appConstant.widthRatio),
            
            imgView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 0 * appConstant.heightRatio),
            imgView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 1 * appConstant.widthRatio),
            imgView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -1 * appConstant.widthRatio),
            imgView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            serviceImg.topAnchor.constraint(equalTo: imgView.topAnchor, constant: 0 * appConstant.heightRatio),
            serviceImg.leadingAnchor.constraint(equalTo: imgView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            serviceImg.trailingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            serviceImg.bottomAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 0 * appConstant.widthRatio),
            
            serviceLbl.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 8 * appConstant.heightRatio),
            serviceLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 6 * appConstant.widthRatio),
            serviceLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -6 * appConstant.widthRatio),
            
            priceLbl.topAnchor.constraint(equalTo: serviceLbl.bottomAnchor, constant: 6 * appConstant.heightRatio),
            priceLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 6 * appConstant.widthRatio),
            priceLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -6 * appConstant.widthRatio),
            priceLbl.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -8 * appConstant.widthRatio),
        ])
    }
    
    private func giveViewShadow(_ view: UIView) {
        serviceImg.layer.cornerRadius = 20 * appConstant.heightRatio
        serviceImg.clipsToBounds = true
        view.layer.cornerRadius = 20 * appConstant.heightRatio
        view.layer.shadowRadius = 1
        view.layer.shadowOpacity = 0.3
        view.layer.shadowColor = shadow_color().cgColor
        view.layer.shadowOffset = .init(width: 0, height: 0)
       
    }
}
