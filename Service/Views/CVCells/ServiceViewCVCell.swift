//
//  ServiceViewCVCell.swift
//  Service
//
//  Created by Hamza on 11/11/2022.
//

import UIKit

class ServiceViewCVCell: UICollectionViewCell {

    lazy var compnyView = ShopServiceView()
    
    var categories: [ShopCategoryModel]? {
        didSet {
            compnyView.category = categories
            compnyView.serviceCV.reloadData()
        }
    }
    
    static var identifier: String = "ServiceViewCVCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        setupCell()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func setupCell(){
        
        contentView.addSubview(compnyView)
       
        NSLayoutConstraint.activate([
            compnyView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0 * appConstant.heightRatio),
            compnyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            compnyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            compnyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0 * appConstant.widthRatio),
            
        ])
    }
    
    
    
}
