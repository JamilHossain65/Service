//
//  LoginVM.swift
//  Service
//
//  Created by Hamza on 12/10/2022.
//

import Foundation
import UIKit
import AuthenticationServices
import GoogleSignIn

class LoginVM: NSObject {
    
    private let signInConfig = GIDConfiguration.init(clientID: appConstant.GOOGLE_CLIENT_ID)
    var vc = UIViewController()
    
    func validate(email: String?, password: String?) -> String? {
        
        let emailOrPhone = email?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = password?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if emailOrPhone?.count == 0 {
            return "Email/Phone is required.".localized
        } else if password?.count == 0 {
            return "Password is required.".localized
        }
        
        return nil
    }
}

extension LoginVM: ASAuthorizationControllerDelegate {
    
    
    func login(request: LoginRequest, completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .login(request)) { (result: Result<LoginModel>) in
            switch result {
            case .success(let value):
                value.code == nil ? (self.setToken(token: value.token.stringValue, completion: { string in
                    completion(nil)
                })) :  completion(value.message)
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func handleAppleIdRequest() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            appleIDProvider.getCredentialState(forUserID: appleIDCredential.user) { (credentialState, error) in
                switch credentialState {
                case .authorized:
                    print("1")
                    break
                case .revoked:
                    print("2")
                    break
                case .notFound:
                    print("3")
                default:
                    break
                }
            }
            let userIdentifier = appleIDCredential.user
            let firstName = (appleIDCredential.fullName?.givenName?.description ?? "")
            let lastName = (appleIDCredential.fullName?.familyName?.description ?? "")
            let email = appleIDCredential.email ?? ""
            let params : [String : Any] = [
                "FirstName": firstName,
                "LastName" : lastName,
                "DeviceUniqueCode" : UIDevice.current.identifierForVendor!.uuidString,
                "DeviceToken" : LoggedUserDetails.shared.token ?? "1234fdsklfjds",
                "DeviceType" : "IOS",
                "UrlImage" : "",
                "AppleUId": userIdentifier,
                "Email": email
            ]
            print(params)
        }
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
    
    @objc func googlebtn_press() {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: vc) { user, error in
            guard error == nil else { return }
            guard let user = user else { return }
            print(user.profile!)
            let params : [String : Any] = [
                "FirstName": user.profile?.givenName ?? "",
                "LastName" : user.profile?.familyName ?? "",
                "DeviceUniqueCode" : UIDevice.current.identifierForVendor!.uuidString,
                "DeviceToken" : LoggedUserDetails.shared.token ?? "1234fdsklfjds",
                "DeviceType" : "IOS",
                "Email" : user.profile?.email ?? "",
                "UrlImage" : user.profile?.imageURL(withDimension: 320) ?? "",
                "IsFacebookUser": true,
                "FacebookUId": "\(String(describing: user.userID!))",
            ]
            print(params)
        }
    }
    
    func setToken(token: String, completion: @escaping(String?) -> Void) {
        LoggedUserDetails.shared.authToken = token
        completion(nil)
    }
}
