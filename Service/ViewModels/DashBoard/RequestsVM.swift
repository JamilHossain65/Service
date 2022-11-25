//
//  RequestsVM.swift
//  Service
//
//  Created by Hamza on 27/10/2022.
//

import Foundation

class RequestsVM {
    var pendingList = [pendingsRequestsModel]()
    var completeList = [pendingsRequestsModel]()
    var qutationLIst = [QutationsModel]()
    
}

extension RequestsVM {
    func getRequests(completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .userRequestList) { (result: Result<requestsRootModel>) in
            switch result {
            case .success(let value):
                guard let data = value.oData else { completion(value.message); return }
                self.pendingList = data.pendingRequests ?? []
                self.completeList = data.completedRequests ?? []
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func getQutations(request: QutationsRequest,completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .userQutations(request)) { (result: Result<QutationsRootModel>) in
            switch result {
            case .success(let value):
                guard let data = value.oData else { completion(value.message); return }
                self.qutationLIst = data.data ?? []
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func acceptQutations(id: Int,completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .acceptQutation(id)) { (result: Result<QutationsRootModel>) in
            switch result {
            case .success(let value):
                value.code == 200 ?  completion(nil) :  completion(value.message)
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func rejectQutations(id: Int,completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .rejectQutation(id)) { (result: Result<QutationsRootModel>) in
            switch result {
            case .success(let value):
                value.code == 200 ?  completion(nil) :  completion(value.message)
            case .failure(let string):
                completion(string)
            }
        }
    }
}
