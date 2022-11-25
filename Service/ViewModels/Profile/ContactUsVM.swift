//
//  ContactUsVM.swift
//  Service
//
//  Created by Hamza on 22/10/2022.
//

import Foundation
import UIKit

class ContactUsVM {
    
    func validate(name: String?, phone: String?, reportType: String?, note: String?) -> String? {
        
        let name = name?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = phone?.trimmingCharacters(in: .whitespacesAndNewlines)
        let report = reportType?.trimmingCharacters(in: .whitespacesAndNewlines)
        let note = note?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if name?.count == 0 {
            return "Name is required.".localized
        } else if phone?.count == 0 {
            return "Mobile number is required.".localized
        } else if reportType?.count == 0 {
            return "Report Type is required.".localized
        } else if note?.count == 0 {
            return "Note is required.".localized
        }
        
        return nil
    }
}

extension ContactUsVM {
    
    func sendMessage(request: ContactUsRequest, completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .contactUs(request)) { (result: Result<BaseModel>) in
            switch result {
            case .success(let value):
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
    
}
