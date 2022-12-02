//
//  DashBoardModel.swift
//  Service
//
//  Created by Hamza on 19/10/2022.
//

import Foundation

struct DashboardModel: Codable {
    let status: Int
    let code: Int
    let message: String
    let oData: [MainCategoryModel]?                                                         
}

struct MainCategoryModel: Codable {
    let id: Int
    let category_name: String?
    let category_priority: Int?
    let category_status: Int?
    let created_at: String?
    let updated_at: String?
    var sub_categories: [SubCategoryModel]?
}

struct SubCategoryModel: Codable {
    let id: Int
    let subcategory_name: String?
    let category_id: Int
    let subcategory_image: String?
    let subcategory_status: Int
}

//MARK: ===== Extension Class =====

extension MainCategoryModel{
    var sub_categoriesPageArray : [Any]{
        var subCatArray:[Any] = []
        var tempArray:[SubCategoryModel] = []
        var indx = 0
        for subCat in sub_categories ?? []{
            let pageIndex = indx / 4
            //let objIndex  = indx % 4
            //print("page ::\(pageIndex) count:: \(objIndex)")
            
            if subCatArray.indices.contains(pageIndex) {
                tempArray.append(subCat)
                subCatArray[pageIndex] = tempArray
            }else{
                tempArray.removeAll()
                tempArray.append(subCat)
                subCatArray.append(tempArray)
            }
            
            indx += 1
        }
        return subCatArray
    }
}
