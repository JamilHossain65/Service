//
//  ServiceViewDelegate.swift
//  Service
//
//  Created by Hamza on 20/10/2022.
//

import Foundation

protocol ServiceViewDelegate {
    func viewAllBtnTapped(subcategories: [SubCategoryModel], heading: String)
    func didTapPageControll(_ serviceView:ServiceView, currentPage:Int)
    func serviceSelect(id: Int, title: String) 
}
