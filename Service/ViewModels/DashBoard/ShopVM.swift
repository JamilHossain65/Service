//
//  ShopVM.swift
//  Service
//
//  Created by Hamza on 22/10/2022.
//

import Foundation

class ShopVM {
    var shopCategories = [ShopCategoryModel]()
    var providersShopList = [CompanyModel]()
}

extension ShopVM {
    func getShopData( completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .shop) { (result: Result<ShopRootModel>) in
            switch result {
            case .success(let value):
                guard let data = value.oData else { completion(nil); return }
                self.providersShopList = data.providerWithProfessionalItems ?? []
                self.shopCategories = data.categories
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
    
}
