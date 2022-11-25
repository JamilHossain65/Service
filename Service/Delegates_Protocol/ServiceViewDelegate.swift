//
//  ServiceViewDelegate.swift
//  Service
//
//  Created by Hamza on 20/10/2022.
//

import Foundation

protocol ServiceViewDelegate {
    func viewAllBtnTapped(subcategories: [SubCategoryModel], heading: String)
    func serviceSelect(id: Int, title: String) 
}
