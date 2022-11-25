//
//  EditProfileController.swift
//  Service
//
//  Created by Hamza on 23/10/2022.
//

import UIKit

class EditProfileController: BaseController {
    
    lazy var userImg = ImageView(imageName: "chat_dummy_ic", cornerRadius: 40)
    lazy var editbtn = Button(imageName: "edit_ic")
    lazy var firstNameTFView = CustomeTextFieldView()
    lazy var lastNameTFView = CustomeTextFieldView()
    lazy var emailTFView = CustomeTextFieldView()
    lazy var mobileTFView = CustomeTextFieldView()
    lazy var submitBtn = createcustomeBtn(text: "Save")
    
    var profileVM = ProfileVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        baseHeadingLbl.text = "Edit Profile"
        searchButtomView.isHidden = true
        showBackbtn(true)
        editbtn.tintColor = theme_color()
        editbtn.setImage(UIImage(systemName: "camera.circle.fill"), for: .normal)
        submitBtn.addTarget(self, action: #selector(updateProfile), for: .touchUpInside)
        setupViews()
    }
    
    func setup() {
        childView.addSubview(userImg)
        childView.addSubview(editbtn)
        childView.addSubview(firstNameTFView)
        childView.addSubview(lastNameTFView)
        childView.addSubview(emailTFView)
        childView.addSubview(mobileTFView)
        childView.addSubview(submitBtn)
        
        NSLayoutConstraint.activate([
            userImg.centerXAnchor.constraint(equalTo: childView.centerXAnchor),
            userImg.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            userImg.heightAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            userImg.widthAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            
            editbtn.bottomAnchor.constraint(equalTo: userImg.bottomAnchor, constant: -8 * appConstant.heightRatio),
            editbtn.trailingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 16 * appConstant.heightRatio),
            editbtn.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            editbtn.widthAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            firstNameTFView.topAnchor.constraint(equalTo: userImg.bottomAnchor, constant: 34 * appConstant.heightRatio),
            firstNameTFView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 28 * appConstant.widthRatio),
            firstNameTFView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -28 * appConstant.widthRatio),
            firstNameTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            lastNameTFView.topAnchor.constraint(equalTo: firstNameTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            lastNameTFView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 28 * appConstant.widthRatio),
            lastNameTFView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -28 * appConstant.widthRatio),
            lastNameTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            emailTFView.topAnchor.constraint(equalTo: lastNameTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            emailTFView.leadingAnchor.constraint(equalTo: firstNameTFView.leadingAnchor),
            emailTFView.trailingAnchor.constraint(equalTo: firstNameTFView.trailingAnchor),
            emailTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            mobileTFView.topAnchor.constraint(equalTo: emailTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            mobileTFView.leadingAnchor.constraint(equalTo: firstNameTFView.leadingAnchor),
            mobileTFView.trailingAnchor.constraint(equalTo: firstNameTFView.trailingAnchor),
            mobileTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            submitBtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 78 * appConstant.widthRatio),
            submitBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -78 * appConstant.widthRatio),
            submitBtn.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -16 * appConstant.heightRatio),
            submitBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
        ])
    }
    
    private func setupViews() {
        firstNameTFView.placeholder = "First Name"
        firstNameTFView.tfImg = "user_ic"
        lastNameTFView.placeholder = "Last name"
        lastNameTFView.tfImg = "user_ic"
        emailTFView.placeholder = "Email"
        emailTFView.tfImg = "email_ic"
        mobileTFView.placeholder = "Mobile"
        mobileTFView.tfImg = "mobile_ic"
        firstNameTFView.txtField.text = LoggedUserDetails.shared.user?.firstName.stringValue
        lastNameTFView.txtField.text = LoggedUserDetails.shared.user?.lastName.stringValue
        emailTFView.txtField.text = LoggedUserDetails.shared.user?.email.stringValue
        mobileTFView.txtField.text = LoggedUserDetails.shared.user?.mobail.stringValue
    }
 
    @objc func updateProfile() {
        let request = MultipartFormDataRequest(url: URL(string: API.baseUrl + "user/update-profile")!)
        request.addDataField(named: "image", data: (self.userImg.image?.pngData()  ?? Data()) , mimeType: "png")//"img/jpeg"
        request.addTextField(named: "mobile", value: self.mobileTFView.txtField.text.stringValue as String)
        request.addTextField(named: "last_name", value: self.firstNameTFView.txtField.text.stringValue  as String)
        request.addTextField(named: "first_name", value: self.lastNameTFView.txtField.text.stringValue  as String)
        self.showProgres()
        profileVM.updateUser(request: request) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.navigationController?.popViewController(animated: true)
        }
    }

}
