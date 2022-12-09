//
//  SignupView.swift
//  Service
//
//  Created by Hamza on 28/09/2022.
//

import Foundation
import UIKit

class SignupView: UIView {
    
    lazy var firstNameTFView = CustomeTextFieldView()
    lazy var lastNameTFView = CustomeTextFieldView()
    lazy var emailTFView = CustomeTextFieldView()
    lazy var passwordTFView = CustomeTextFieldView()
    lazy var mobileTFView = CustomeTextFieldView()
    lazy var confirmPasswordTFView = CustomeTextFieldView()
    lazy var registerBtn = createcustomeBtn(text: "Register")
    lazy var scrollbgView =  View()
    lazy var scrollView = UIScrollView()
    
    var delegate: RegisterDelegate?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = false
        self.scrollbgView.backgroundColor = viewController_color()
        commonInit()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    func commonInit() {
        setupViews()
        initialize_setup()
        initialize_layout()
    }
    func initialize_setup() {
        registerBtn.addTarget(self, action: #selector(registerBtnTapped), for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        addSubview(scrollView)
        scrollView.addSubview(scrollbgView)
        scrollbgView.addSubview(firstNameTFView)
        scrollbgView.addSubview(lastNameTFView)
        scrollbgView.addSubview(emailTFView)
        scrollbgView.addSubview(passwordTFView)
        scrollbgView.addSubview(mobileTFView)
        scrollbgView.addSubview(confirmPasswordTFView)
        scrollbgView.addSubview(registerBtn)
    }
    func initialize_layout()    {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),

            scrollbgView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollbgView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollbgView.trailingAnchor.constraint(equalTo:scrollView.trailingAnchor),
            scrollbgView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollbgView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),
            
            firstNameTFView.topAnchor.constraint(equalTo: scrollbgView.topAnchor, constant: 12 * appConstant.heightRatio),
            firstNameTFView.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 28 * appConstant.widthRatio),
            firstNameTFView.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -28 * appConstant.widthRatio),
            firstNameTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            lastNameTFView.topAnchor.constraint(equalTo: firstNameTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            lastNameTFView.leadingAnchor.constraint(equalTo: firstNameTFView.leadingAnchor),
            lastNameTFView.trailingAnchor.constraint(equalTo: firstNameTFView.trailingAnchor),
            lastNameTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            emailTFView.topAnchor.constraint(equalTo: lastNameTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            emailTFView.leadingAnchor.constraint(equalTo: firstNameTFView.leadingAnchor),
            emailTFView.trailingAnchor.constraint(equalTo: firstNameTFView.trailingAnchor),
            emailTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            mobileTFView.topAnchor.constraint(equalTo: emailTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            mobileTFView.leadingAnchor.constraint(equalTo: firstNameTFView.leadingAnchor),
            mobileTFView.trailingAnchor.constraint(equalTo: firstNameTFView.trailingAnchor),
            mobileTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            passwordTFView.topAnchor.constraint(equalTo: mobileTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            passwordTFView.leadingAnchor.constraint(equalTo: firstNameTFView.leadingAnchor),
            passwordTFView.trailingAnchor.constraint(equalTo: firstNameTFView.trailingAnchor),
            passwordTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            confirmPasswordTFView.topAnchor.constraint(equalTo: passwordTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            confirmPasswordTFView.leadingAnchor.constraint(equalTo: firstNameTFView.leadingAnchor),
            confirmPasswordTFView.trailingAnchor.constraint(equalTo: firstNameTFView.trailingAnchor),
            confirmPasswordTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
        
            registerBtn.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 78 * appConstant.widthRatio),
            registerBtn.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -78 * appConstant.widthRatio),
            registerBtn.topAnchor.constraint(equalTo: confirmPasswordTFView.bottomAnchor, constant: 30 * appConstant.heightRatio),
            registerBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            registerBtn.bottomAnchor.constraint(equalTo: scrollbgView.bottomAnchor, constant: -30 * appConstant.heightRatio),
        
        ])
       
    }
    
    private func setupViews() {
        firstNameTFView.placeholder = "First name"
        firstNameTFView.tfImg = "user_ic"
        lastNameTFView.placeholder = "Last name"
        lastNameTFView.tfImg = "user_ic"
        emailTFView.placeholder = "Email"
        emailTFView.tfImg = "email_ic"
        mobileTFView.placeholder = "Mobile"
        mobileTFView.tfImg = "mobile_ic"
        passwordTFView.placeholder = "Password"
        passwordTFView.tfImg = "password_ic"
        confirmPasswordTFView.placeholder = "Confirm password"
        confirmPasswordTFView.tfImg = "password_ic"
//        firstNameTFView.txtField.text = "abc"
//        lastNameTFView.txtField.text = "abc"
//        emailTFView.txtField.text = "hamza@gmail.com"
//        mobileTFView.txtField.text = "123456"
//        passwordTFView.txtField.text = "12345678"
//        confirmPasswordTFView.txtField.text = "12345678"
    }
    
    @objc func registerBtnTapped() {
        let request = RegisterRequest(firstName: firstNameTFView.txtField.text.stringValue, lastName: lastNameTFView.txtField.text.stringValue, mobile: mobileTFView.txtField.text.stringValue, email: emailTFView.txtField.text.stringValue, device_token: AppConstants.device_udid, password: passwordTFView.txtField.text.stringValue, confirmPassword: confirmPasswordTFView.txtField.text.stringValue)
        delegate?.registerBtnTapped(registerRequest: request)
    }
}
