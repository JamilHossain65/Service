//
//  ProfileVM.swift
//  Service
//
//  Created by Hamza on 21/10/2022.
//

import Foundation

class ProfileVM {
    
}

extension ProfileVM {
    func getUser(completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .userDetail) { (result: Result<UserModel>) in
            switch result {
            case .success(let value):
                guard let data = value.oData else { completion(nil); return }
                LoggedUserDetails.shared.updateUser(userModel: data)
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func updateUser(request: MultipartFormDataRequest, completion: @escaping(String?) -> Void) {
        APIClient.shared.requestWithMultiformData(request: request) { (result: Result<UserModel>) in
            switch result {
            case .success(let value):
                guard let data = value.oData else { completion(value.message); return }
                value.code == 200 ? completion(nil) : completion(value.errors?.first?.value ?? "Error")
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func logoutUser(completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .logout) { (result: Result<UserModel>) in
            switch result {
            case .success(let value):
                guard let data = value.oData else { completion(nil); return }
                LoggedUserDetails.shared.updateUser(userModel: data)
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
}
