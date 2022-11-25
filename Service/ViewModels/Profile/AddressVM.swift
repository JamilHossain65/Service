//
//  AddressVM.swift
//  Service
//
//  Created by Hamza on 26/10/2022.
//

import Foundation

class AddressVM {
    var addressList = [AddressModel]()
}

extension AddressVM {
    func getAddressList(completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .address) { (result: Result<AddressRootModel>) in
            switch result {
            case .success(let value):
                guard let data = value.oData else { completion(nil); return }
                self.addressList = data
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func addAddressList(request: AddAddressRequest,completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .addAddress(request)) { (result: Result<AddAddressRootModel>) in
            switch result {
            case .success(let value):
                value.code == 201 ? completion(nil) : completion(value.errors?.first?.value ?? "Error")
            case .failure(let string):
                completion(string)
            }
        }
    }
}
