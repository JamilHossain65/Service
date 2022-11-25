//
//  AddAddressController.swift
//  Service
//
//  Created by Hamza on 26/10/2022.
//

import UIKit

class AddAddressController: BaseController {
    
    lazy var titleTFView = CustomeTextFieldView()
    lazy var addressTxtView = createTxtView(rad: 20, placeHolder: "Address here")
    lazy var submitBtn = createcustomeBtn(text: "Save")

    let addressVM = AddressVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup() 
    }
    
    private func initUI() {
        baseHeadingLbl.text = "Add Address"
        searchButtomView.isHidden = true
        showBackbtn(true)
        addressTxtView.backgroundColor = .white
        addressTxtView.delegate = self
        titleTFView.logoImg.image =  UIImage(systemName: "paperplane.fill")
        titleTFView.tintColor = .lightGray
        titleTFView.placeholder = "Title"
        submitBtn.addTarget(self, action: #selector(saveBtnTapped), for: .touchUpInside)
    }
    
    private func setup() {
        childView.addSubview(titleTFView)
        childView.addSubview(addressTxtView)
        childView.addSubview(submitBtn)
        
        NSLayoutConstraint.activate([
            titleTFView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 34 * appConstant.heightRatio),
            titleTFView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 28 * appConstant.widthRatio),
            titleTFView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -28 * appConstant.widthRatio),
            titleTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            addressTxtView.leadingAnchor.constraint(equalTo: titleTFView.leadingAnchor),
            addressTxtView.trailingAnchor.constraint(equalTo: titleTFView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            addressTxtView.topAnchor.constraint(equalTo: titleTFView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            addressTxtView.heightAnchor.constraint(equalToConstant: 200 * appConstant.heightRatio),
            
            submitBtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 78 * appConstant.widthRatio),
            submitBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -78 * appConstant.widthRatio),
            submitBtn.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -50 * appConstant.heightRatio),
            submitBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
        ])
    }
    
    @objc func saveBtnTapped() {
        let request = AddAddressRequest(address_title: titleTFView.txtField.text.stringValue, complete_address: addressTxtView.text.stringValue, is_default: 0, user_id: LoggedUserDetails.shared.user?.id ?? 0)
        self.showProgres()
        addressVM.addAddressList(request: request) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension AddAddressController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.layer.borderColor = theme_color().cgColor
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.layer.borderColor = tf_border().cgColor
    }
}

