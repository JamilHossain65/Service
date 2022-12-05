//
//  ProviderVM.swift
//  Service
//
//  Created by Hamza on 22/10/2022.
//

import Foundation

class ProviderVM {
    var providerList = [ProviderModel]()
}

extension ProviderVM {
    func getProviderList(id: String, completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .providersForCategoryId(id)) { (result: Result<ProviderRootModel>) in
            switch result {
            case .success(let value):
                guard let data = value.oData else { completion(nil); return }
                self.providerList = data
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
}
