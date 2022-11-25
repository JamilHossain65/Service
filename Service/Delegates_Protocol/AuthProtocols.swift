//
//  LoginDelegate.swift
//  Service
//
//  Created by Hamza on 12/10/2022.
//

import Foundation

protocol LoginDelegate {
    func loginBtnTapped(loginRequest: LoginRequest)
}

protocol RegisterDelegate {
    func registerBtnTapped(registerRequest: RegisterRequest)
}
