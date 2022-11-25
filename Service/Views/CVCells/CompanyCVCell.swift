//
//  CompanyCVCell.swift
//  Service
//
//  Created by Hamza on 11/11/2022.
//

import UIKit

class CompanyCVCell: UICollectionViewCell {
    
    lazy var bgView = View(backgroundColor: .clear)
    lazy var compnyView = CompnyShopView()
    
    var companies: CompanyModel? {
        didSet {
            compnyView.compnyItems = companies?.professional_items
        }
    }
    
    var delegate: CompanyCVCellDelegate?
    static var identifier: String = "CompanyCVCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        compnyView.delegate = self
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
        contentView.addSubview(compnyView)
        
        NSLayoutConstraint.activate([
            compnyView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0 * appConstant.heightRatio),
            compnyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            compnyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            compnyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0 * appConstant.widthRatio),
        ])
    }
}

extension CompanyCVCell: CompnayShopViewDelegate {
    func viewAllShopBtnTapped(subcategories: [SubCategoryModel], heading: String) {
        
    }
    
    func serviceShopSelect() {
        
    }
    
    func companySrviceSelect(productId: Int) {
        self.delegate?.companySrviceSelect(productId: productId)
    }
}
