//
//  SearchVM.swift
//  Service
//
//  Created by Hamza on 19/10/2022.
//

import Foundation


class SearchVM {
    var providerData: ProviderData?
    var searviceList = [ServiceModel]()
    
    var filteredSearviceList = [ServiceModel]()
    
    func setFilteredService(list:[ServiceModel]){
        let categoryIds = list.compactMap{$0.category_id}.uniqued()
        print("categoryList:::\(categoryIds)")
        var array = [Int:[ServiceModel]]()
        for catId in categoryIds{
            let categoryIds = list.filter{$0.category_id == catId}
            array[catId] = categoryIds
            print("array:::\(array)")
        }
    }
}

extension SearchVM {
    
    func getSearchedDashboard(searchText:String, completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .searchProfessional(searchText)) { (result: Result<ServiceRootModel>) in
            switch result {
            case .success(let value):
                guard let data = value.oData.services else { completion(nil); return }
                self.providerData = value.oData
                self.searviceList = data
                self.setFilteredService(list: data)
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
}
