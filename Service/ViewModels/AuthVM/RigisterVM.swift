//
//  RigisterVM.swift
//  Service
//
//  Created by Hamza on 12/10/2022.
//

import Foundation

class RigsterVM {
    
    func validate(firstName: String?, lastName: String?, mobail: String?, email: String?, password: String?, confirmPassword: String?) -> String? {
        let firstName = firstName?.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastName?.trimmingCharacters(in: .whitespacesAndNewlines)
        let mobail = mobail?.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailOrPhone = email?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = password?.trimmingCharacters(in: .whitespacesAndNewlines)
        let confirmpassword = confirmPassword?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if firstName?.count == 0 {
            return "First name is required.".localized
        } else if lastName?.count == 0 {
            return "Last name is required.".localized
        } else if mobail?.count == 0 {
            return "Mobail number is required.".localized
        } else if emailOrPhone?.count == 0 {
            return "Email/Phone is required.".localized
        } else if password?.count == 0 {
            return "Password is required.".localized
        } else if confirmpassword?.count == 0 {
            return "Confirm Password is required.".localized
        } else if confirmpassword != password {
            return "Password and confirm password should be same.".localized
        }
        
        return nil
    }
    
}

extension RigsterVM {
    func register(request: RegisterRequest, completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .register(request)) { (result:Result<SignupModel>) in
            switch result {
            case .success(let value):
                value.code == 200 ? completion(nil) : completion(value.errors.first?.value.first ?? "Error")
                completion(nil)
            case .failure(let message):
                print(message)
                completion(message)
            }
        }
    }
}
