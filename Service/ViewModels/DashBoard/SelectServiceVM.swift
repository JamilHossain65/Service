//
//  SelectServiceVM.swift
//  Service
//
//  Created by Hamza on 22/10/2022.
//

import Foundation

class SelectServiceVM {
    var serviceList = [ServiceModel]()
}

extension SelectServiceVM {
    func getServiceList(id: String, completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .selectService(id)) { (result: Result<ServiceRootModel>) in
            switch result {
            case .success(let value):
                guard let data = value.oData.services else { completion(nil); return }
                self.serviceList = data
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func saveRequest(request: MultipartFormDataRequest, completion: @escaping(String?) -> Void) {
        APIClient.shared.requestWithMultiformData(request: request) { (result: Result<BaseModel>) in
            switch result {
            case .success(let value):
                value.code == 200 ? completion(nil) : completion(value.errors?.first?.value?.first ?? "Error")
            case .failure(let string):
                completion(string)
            }
        }
    }
}
