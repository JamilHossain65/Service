//
//  SubcategoryCVCell.swift
//  Service
//
//  Created by Hamza on 28/09/2022.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit

class SubcategoryCVCell: UICollectionViewCell {
    
    let bgView     = View(backgroundColor: theme_color())
    let borderView = View(backgroundColor: .red)
    let serviceImg = ImageView(imageName: "service_ic")
    let serviceLbl = Label(text: "Electricians",color: .white, numberOfLines: 1)
    
    static var identifier: String = "SubcategoryCVCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 20 * appConstant.heightRatio
        bgView.layer.shadowRadius = 1
        bgView.layer.shadowOpacity = 0.3
        bgView.layer.shadowColor = shadow_color().cgColor
        bgView.layer.shadowOffset = .init(width: 0, height: 0)
        bgView.layer.borderColor = UIColor.white.cgColor
        bgView.layer.borderWidth = 2.5 * appConstant.heightRatio
        
        serviceLbl.font = UIFont.systemFont(ofSize: 13.s)
        
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
        
        bgView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        serviceImg.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(15.s)
            make.leading.equalToSuperview().offset(15.s)
            make.trailing.equalToSuperview().offset(-15.s)
            make.centerX.equalToSuperview()
//            make.height.equalTo(bgView.frame.height - 45.s)
//            make.width.equalTo(self.frame.height * 1)
            make.bottom.equalTo(bgView).offset(-25.s)
        }
        
        serviceLbl.snp.makeConstraints{ make in
            make.bottom.equalTo(serviceImg).offset(0.s)
            make.leading.equalToSuperview().offset(5.s)
            make.trailing.equalToSuperview().offset(-5.s)
            //make.height.lessThanOrEqualTo(20.s)
            make.bottom.equalTo(bgView).offset(-8.s)
        }
    }
    
    func setupData(_ subCat: SubCategoryModel) {
        serviceLbl.text = subCat.subcategory_name
        let randomInt = Int.random(in: 0..<AppColors.bgColors.count)
        bgView.backgroundColor = AppColors.bgColors[randomInt] //.random()
        serviceImg.kf.setImage(with: .network(URL(string: subCat.subcategory_image!)!))
    }
    
    func setupShopServiceData(_ subCat: ShopCategoryModel) {
        serviceLbl.text = subCat.category_name
        bgView.backgroundColor = .random()
    }
}
