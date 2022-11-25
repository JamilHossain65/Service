//
//  HomeVM.swift
//  Service
//
//  Created by Hamza on 19/10/2022.
//

import Foundation


class HomeVM {
    var catgoriesList = [MainCategoryModel]()
}

extension HomeVM {
    func getDashboard(completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .dashBoard) { (result: Result<DashboardModel>) in
            switch result {
            case .success(let value):
                guard let data = value.oData else { completion(nil); return }
                self.catgoriesList = data
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
}
