//
//  ContactusController.swift
//  Service
//
//  Created by Hamza on 22/10/2022.
//

import UIKit

class ContactusController: BaseController {
    
    lazy var nameTFView = CustomeTextFieldView()
    lazy var mobailTFView = CustomeTextFieldView()
    lazy var reportTFView = CustomeTextFieldView()
    lazy var reportTxtView = createTxtView(rad: 20)
    lazy var messageLbl = Label(text: "Message", font: Font.semiBold(14), color: .black)
    lazy var submitBtn = createcustomeBtn(text: "Submit")
    lazy var followLbl = Label(text: "Follow us on", font: Font.semiBold(16), color: .black)
    lazy var fbBtn = Button(imageName: "fb-ic", cornerRadius: 20)
    lazy var instaBtn = Button(imageName: "insta_ic", cornerRadius: 20)
    lazy var twiterBtn = Button(imageName: "twiter_ic", cornerRadius: 20)
    
    var contactUsVM = ContactUsVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        baseHeadingLbl.text = "Contact Us"
        searchButtomView.isHidden = true
        reportTxtView.placeholder = "Report"
        reportTxtView.backgroundColor = .white
        showBackbtn(true)
        setupViews()
        submitBtn.addTarget(self, action: #selector(sumbitBtnTapped), for: .touchUpInside)
    }
    
    func setup() {
        childView.addSubview(nameTFView)
        childView.addSubview(mobailTFView)
        childView.addSubview(reportTFView)
        childView.addSubview(messageLbl)
        childView.addSubview(reportTxtView)
        childView.addSubview(submitBtn)
        childView.addSubview(followLbl)
        childView.addSubview(fbBtn)
        childView.addSubview(instaBtn)
        childView.addSubview(twiterBtn)
    
        NSLayoutConstraint.activate([
            nameTFView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 34 * appConstant.heightRatio),
            nameTFView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 28 * appConstant.widthRatio),
            nameTFView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -28 * appConstant.widthRatio),
            nameTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            mobailTFView.topAnchor.constraint(equalTo: nameTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            mobailTFView.leadingAnchor.constraint(equalTo: nameTFView.leadingAnchor),
            mobailTFView.trailingAnchor.constraint(equalTo: nameTFView.trailingAnchor),
            mobailTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            reportTFView.topAnchor.constraint(equalTo: mobailTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            reportTFView.leadingAnchor.constraint(equalTo: nameTFView.leadingAnchor),
            reportTFView.trailingAnchor.constraint(equalTo: nameTFView.trailingAnchor),
            reportTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            messageLbl.topAnchor.constraint(equalTo: reportTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            messageLbl.leadingAnchor.constraint(equalTo: reportTFView.leadingAnchor, constant: 4 * appConstant.heightRatio),
            
            reportTxtView.topAnchor.constraint(equalTo: messageLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            reportTxtView.leadingAnchor.constraint(equalTo: messageLbl.leadingAnchor),
            reportTxtView.trailingAnchor.constraint(equalTo: nameTFView.trailingAnchor),
            reportTxtView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            submitBtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 78 * appConstant.widthRatio),
            submitBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -78 * appConstant.widthRatio),
            submitBtn.topAnchor.constraint(equalTo: reportTxtView.bottomAnchor, constant: 30 * appConstant.heightRatio),
            submitBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            followLbl.centerXAnchor.constraint(equalTo: childView.centerXAnchor),
            followLbl.topAnchor.constraint(equalTo: submitBtn.bottomAnchor, constant: 30 * appConstant.heightRatio),
            followLbl.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            instaBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            instaBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            instaBtn.topAnchor.constraint(equalTo: followLbl.bottomAnchor, constant: 30 * appConstant.heightRatio),
            instaBtn.centerXAnchor.constraint(equalTo: childView.centerXAnchor, constant: 0 * appConstant.widthRatio),
            
            twiterBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            twiterBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            twiterBtn.centerYAnchor.constraint(equalTo: instaBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            twiterBtn.leadingAnchor.constraint(equalTo: instaBtn.trailingAnchor, constant: 30 * appConstant.widthRatio),
            
            fbBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            fbBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            fbBtn.centerYAnchor.constraint(equalTo: instaBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            fbBtn.trailingAnchor.constraint(equalTo: instaBtn.leadingAnchor, constant: -30 * appConstant.widthRatio),
            
        ])
    }
    
    private func setupViews() {
        nameTFView.tfImg = "user_ic"
        mobailTFView.tfImg = "mobile_ic"
        reportTFView.tfImg = "report_ic"
        nameTFView.placeholder = "Name"
        mobailTFView.placeholder = "Mobile"
        reportTFView.placeholder = "Report Type"
    }

    @objc func sumbitBtnTapped() {
        let hasErrorMessage = contactUsVM.validate(name: nameTFView.txtField.text.stringValue, phone: mobailTFView.txtField.text.stringValue, reportType: reportTFView.txtField.text.stringValue, note: reportTxtView.text.stringValue)
        if let message = hasErrorMessage {
            self.showErrorView(message: message)
            return
        }
        let request = ContactUsRequest(name: nameTFView.txtField.text.stringValue, mobile: mobailTFView.txtField.text.stringValue, report_type: reportTFView.txtField.text.stringValue, message: reportTxtView.text.stringValue)
        self.showProgres()
        contactUsVM.sendMessage(request: request) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
        }
    }

}
