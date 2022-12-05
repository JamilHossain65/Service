//
//  ServiceCVCell.swift
//  Service
//
//  Created by Hamza on 28/09/2022.
//

import Foundation
import UIKit
import Kingfisher

class ServiceCVCell: UICollectionViewCell {
    
    let bgView     = View(backgroundColor: theme_color())
    let serviceImg = ImageView(imageName: "service_ic")
    let serviceLbl = Label(text: "Electricians",color: .white, numberOfLines: 2)
    
    static var identifier: String = "ServiceCVCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 20 * appConstant.heightRatio
        bgView.layer.shadowRadius = 1
        bgView.layer.shadowOpacity = 0.3
        bgView.layer.shadowColor = shadow_color().cgColor
        bgView.layer.shadowOffset = .init(width: 0, height: 0)
        bgView.layer.borderColor = UIColor.white.cgColor
        bgView.layer.borderWidth = 1 * appConstant.heightRatio
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
        bgView.addSubview(serviceLbl)
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4 * appConstant.heightRatio),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4 * appConstant.widthRatio),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4 * appConstant.widthRatio),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4 * appConstant.widthRatio),
            
            serviceImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0 * appConstant.heightRatio),
            serviceImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            serviceImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            serviceImg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40 * appConstant.widthRatio),
            
            serviceLbl.topAnchor.constraint(equalTo: serviceImg.bottomAnchor, constant: 2 * appConstant.heightRatio),
            serviceLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4 * appConstant.widthRatio),
            serviceLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4 * appConstant.widthRatio),
            serviceLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4 * appConstant.widthRatio),
        ])
    }
    
    func setupData(_ serviceModel: ServiceModel) {
        serviceLbl.text = serviceModel.service_name
        let randomInt = Int.random(in: 0..<AppColors.bgColors.count)
        bgView.backgroundColor = AppColors.bgColors[randomInt] //.random()
        
        if let imgUrl = serviceModel.service_image {
            serviceImg.kf.setImage(with: .network(URL(string: imgUrl)!))
        }
    }
    
    func setupShopServiceData(_ subCat: ShopCategoryModel) {
        serviceLbl.text = subCat.category_name
        bgView.backgroundColor = .random()
    }
}
