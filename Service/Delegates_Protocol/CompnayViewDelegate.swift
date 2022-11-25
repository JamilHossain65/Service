//
//  CompnayViewDelegate.swift
//  Service
//
//  Created by Hamza on 20/10/2022.
//

import Foundation

protocol CompnayShopViewDelegate {
    func viewAllShopBtnTapped(subcategories: [SubCategoryModel], heading: String)
    func serviceShopSelect()
    func companySrviceSelect(productId: Int)
}

extension CompnayShopViewDelegate {
    func companySrviceSelect(productId: Int) {
        
    }
}


protocol CompanyCVCellDelegate {
    func companySrviceSelect(productId: Int)
}

protocol ShopViewDelegate {
    func openProductDetailController(productId: Int)
}
