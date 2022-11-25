//
//  loginView.swift
//  Service
//
//  Created by Hamza on 27/09/2022.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    lazy var emailTFView = CustomeTextFieldView()
    lazy var passwordTFView = CustomeTextFieldView()
    lazy var forgotBtn = Button(text: "Forgot password?", textColor: theme_gray())
    lazy var remberMeLbl = Label(text: "Remember me", font: Font.medium(14), color: .black)
    lazy var remberSwitch = createSwitch()
    lazy var loginBtn = createcustomeBtn(text: "Login")
    lazy var loginWithLbl = Label(text: "Or Login with", font: Font.semiBold(16), color: .black)
    lazy var appleBtn = Button(imageName: "apple_ic", cornerRadius: 20)
    lazy var googleBtn = Button(imageName: "google_ic", cornerRadius: 20)
    lazy var scrollbgView =  View()
    lazy var scrollView = UIScrollView()
    
    var delegate: LoginDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.scrollbgView.backgroundColor = viewController_color()
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .yellow
        commonInit()
    }
    
    func commonInit() {
        setupViews()
        initialize_setup()
        initialize_layout()
    }
    func initialize_setup() {
//        emailTFView.txtField.text = "user@user.com"`
//        passwordTFView.txtField.text = "1234567"`
        loginBtn.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        remberSwitch.addTarget(self, action: #selector(switchTapped), for: .valueChanged)
        self.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        addSubview(scrollView)
        scrollView.addSubview(scrollbgView)
        scrollbgView.addSubview(emailTFView)
        scrollbgView.addSubview(passwordTFView)
        scrollbgView.addSubview(forgotBtn)
        scrollbgView.addSubview(remberMeLbl)
        scrollbgView.addSubview(remberSwitch)
        scrollbgView.addSubview(loginBtn)
        scrollbgView.addSubview(loginWithLbl)
        scrollbgView.addSubview(googleBtn)
        scrollbgView.addSubview(appleBtn)
    }
    
    func initialize_layout() {
        
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
            
            emailTFView.topAnchor.constraint(equalTo: scrollbgView.topAnchor, constant: 12 * appConstant.heightRatio),
            emailTFView.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 28 * appConstant.widthRatio),
            emailTFView.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -28 * appConstant.widthRatio),
            emailTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            passwordTFView.topAnchor.constraint(equalTo: emailTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            passwordTFView.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 28 * appConstant.widthRatio),
            passwordTFView.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -28 * appConstant.widthRatio),
            passwordTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            forgotBtn.trailingAnchor.constraint(equalTo: passwordTFView.trailingAnchor),
            forgotBtn.topAnchor.constraint(equalTo: passwordTFView.bottomAnchor, constant: 18 * appConstant.heightRatio),
            forgotBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            remberMeLbl.leadingAnchor.constraint(equalTo: passwordTFView.leadingAnchor),
            remberMeLbl.topAnchor.constraint(equalTo: forgotBtn.bottomAnchor, constant: 40 * appConstant.heightRatio),
            
            remberSwitch.centerYAnchor.constraint(equalTo: remberMeLbl.centerYAnchor),
            remberSwitch.trailingAnchor.constraint(equalTo: passwordTFView.trailingAnchor),
            remberSwitch.widthAnchor.constraint(equalToConstant: 44 * appConstant.widthRatio),
            remberSwitch.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            loginBtn.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 78 * appConstant.widthRatio),
            loginBtn.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -78 * appConstant.widthRatio),
            loginBtn.topAnchor.constraint(equalTo: remberSwitch.bottomAnchor, constant: 30 * appConstant.heightRatio),
            loginBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            loginWithLbl.centerXAnchor.constraint(equalTo: scrollbgView.centerXAnchor),
            loginWithLbl.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 40 * appConstant.heightRatio),
            loginWithLbl.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            appleBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            appleBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            appleBtn.topAnchor.constraint(equalTo: loginWithLbl.bottomAnchor, constant: 30 * appConstant.heightRatio),
            appleBtn.trailingAnchor.constraint(equalTo: scrollbgView.centerXAnchor, constant: -10 * appConstant.widthRatio),
            
            googleBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            googleBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            googleBtn.topAnchor.constraint(equalTo: loginWithLbl.bottomAnchor, constant: 30 * appConstant.heightRatio),
            googleBtn.leadingAnchor.constraint(equalTo: scrollbgView.centerXAnchor, constant: 10 * appConstant.widthRatio),
            googleBtn.bottomAnchor.constraint(equalTo: scrollbgView.bottomAnchor, constant: -30 * appConstant.heightRatio),
        ])
       
    }
    
    private func setupViews() {
        emailTFView.placeholder = "Email"
        emailTFView.tfImg = "user_ic"
        passwordTFView.placeholder = "Password"
        passwordTFView.tfImg = "password_ic"
    }
    
    @objc func loginBtnTapped() {
        let request = LoginRequest(email: emailTFView.txtField.text.stringValue, password: passwordTFView.txtField.text.stringValue)
        delegate?.loginBtnTapped(loginRequest: request)
    }
    
    @objc func switchTapped(_ sender: UISwitch) {
        print("sender.isOn = ", sender.isOn)
        LoggedUserDetails.shared.isRemember = sender.isOn
    }
}
