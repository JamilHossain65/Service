//
//  UserRequestDetailController.swift
//  Service
//
//  Created by Hamza on 03/10/2022.
//

import UIKit

class UserRequestDetailController: BaseController {
    
    lazy var scrollbgView =  View()
    lazy var scrollView = UIScrollView()
    lazy var userImg = ImageView(imageName: "chat_dummy_ic", cornerRadius: 40)
    lazy var nameLbl = Label(text: "Mohammed Ali ", font: Font.semiBold(16), color: .black, alignment: .left)
    lazy var msgLbl = Label(text: "A unique electronic service provided by the public Authority of...", font: Font.medium(12), color: .black, alignment: .left, numberOfLines: 2)
    lazy var providerShowLbl = Label(text: "Power Electronics ", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var stutslbl = Label(text: "Selected Date & Time", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 1)
    lazy var stutsShowLbl = Label(text: "May 2022, 08:00 AM", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var amountlbl = Label(text: "Amount", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 1)
    lazy var amountShowLbl = Label(text: "KD 50.000", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 1)
    
    lazy var requestView = View(backgroundColor: .white, cornerRadius: 20)
    lazy var requestTopView = View(backgroundColor: theme_color(),cornerRadius: 0)
    lazy var requestHShowLbl = Label(text: "Completion request", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var infoBtn = Button(imageName: "info_ic")
    lazy var providerImg = ImageView(imageName: "chat_dummy_ic", cornerRadius: 40)
    lazy var providerLbl = Label(text: "Mohammed Ali", font: Font.semiBold(16), color: .black, alignment: .left)
    lazy var providerMsgLbl = Label(text: "Technician Services Repair AC, Air Conditioners and All Electronic COMPUTER REPAIRS , WIRELESS SYSTEMS,HOME SECURITY SYSTEMS.", font: Font.medium(12), color: .black, alignment: .left, numberOfLines: 4)
    lazy var acceptBtn = Button(text: "Accept", backgroundColor: theme_color(), textColor: .black, cornerRadius: 20)
    lazy var rejectBtn = Button(text: "Reject", backgroundColor: unselected_color(), textColor: .black, cornerRadius: 20)
    lazy var disclimerLbl = Label(text: "DISCLAIMERS", font: Font.semiBold(16), color: .black, alignment: .left)
    lazy var disclimerMsgLbl = Label(text: "A disclaimer is generally any statement intended to specify or delimit the scope of rights and obligations that may be exercised and enforced by parties in a legally recognized relationship.", font: Font.medium(12), color: .black, alignment: .left, numberOfLines: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        requestDetailView.isHidden = false
        searchButtomView.isHidden = true
        requestView.clipsToBounds = true
        scrollbgView.backgroundColor = viewController_color()
        showBackbtn(true)
        setupShadow()
        baseHeadingLbl.text = "Request ID 7654321"
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
    }
    
    private func setup() {
        childView.addSubview(scrollView)
        scrollView.addSubview(scrollbgView)
        requestDetailView.addSubview(userImg)
        requestDetailView.addSubview(nameLbl)
        requestDetailView.addSubview(msgLbl)
        requestDetailView.addSubview(providerShowLbl)
        requestDetailView.addSubview(amountlbl)
        requestDetailView.addSubview(amountShowLbl)
        requestDetailView.addSubview(stutslbl)
        requestDetailView.addSubview(stutsShowLbl)
        view.addSubview(requestView)
        requestView.addSubview(requestTopView)
        requestTopView.addSubview(requestHShowLbl)
        requestTopView.addSubview(infoBtn)
        requestView.addSubview(providerImg)
        requestView.addSubview(providerLbl)
        requestView.addSubview(providerMsgLbl)
        requestView.addSubview(acceptBtn)
        requestView.addSubview(rejectBtn)
        scrollbgView.addSubview(disclimerLbl)
        scrollbgView.addSubview(disclimerMsgLbl)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: requestView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),

            scrollbgView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollbgView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollbgView.trailingAnchor.constraint(equalTo:scrollView.trailingAnchor),
            scrollbgView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollbgView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),
            
            userImg.leadingAnchor.constraint(equalTo: requestDetailView.leadingAnchor, constant: 35 * appConstant.widthRatio),
            userImg.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30 * appConstant.heightRatio),
            userImg.heightAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            userImg.widthAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            
            nameLbl.leadingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 9 * appConstant.widthRatio),
            nameLbl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30 * appConstant.heightRatio),
            nameLbl.trailingAnchor.constraint(equalTo: requestDetailView.trailingAnchor, constant: -30 * appConstant.widthRatio),
            
            msgLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            msgLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 6 * appConstant.heightRatio),
            msgLbl.trailingAnchor.constraint(equalTo: requestDetailView.trailingAnchor, constant: -30 * appConstant.widthRatio),
            
            providerShowLbl.leadingAnchor.constraint(equalTo: userImg.leadingAnchor),
            providerShowLbl.topAnchor.constraint(equalTo: userImg.bottomAnchor, constant: 18 * appConstant.heightRatio),
            
            amountlbl.leadingAnchor.constraint(equalTo: userImg.leadingAnchor),
            amountlbl.topAnchor.constraint(equalTo: providerShowLbl.bottomAnchor, constant: 14 * appConstant.heightRatio),
            
            amountShowLbl.leadingAnchor.constraint(equalTo: amountlbl.leadingAnchor),
            amountShowLbl.topAnchor.constraint(equalTo: amountlbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            
            stutslbl.leadingAnchor.constraint(equalTo: requestDetailView.centerXAnchor),
            stutslbl.centerYAnchor.constraint(equalTo: amountlbl.centerYAnchor),
            
            stutsShowLbl.leadingAnchor.constraint(equalTo: stutslbl.leadingAnchor),
            stutsShowLbl.centerYAnchor.constraint(equalTo: amountShowLbl.centerYAnchor),
            
            requestView.leadingAnchor.constraint(equalTo: requestDetailView.leadingAnchor, constant: 38 * appConstant.widthRatio),
            requestView.trailingAnchor.constraint(equalTo: requestDetailView.trailingAnchor, constant: -38 * appConstant.widthRatio),
            requestView.topAnchor.constraint(equalTo: requestDetailView.bottomAnchor, constant: -46 * appConstant.heightRatio),
            requestView.heightAnchor.constraint(equalToConstant: 270 * appConstant.heightRatio),
            
            requestTopView.leadingAnchor.constraint(equalTo: requestView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            requestTopView.trailingAnchor.constraint(equalTo: requestView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            requestTopView.topAnchor.constraint(equalTo: requestView.topAnchor, constant: 0 * appConstant.heightRatio),
            requestTopView.heightAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            
            requestHShowLbl.centerYAnchor.constraint(equalTo: requestTopView.centerYAnchor),
            requestHShowLbl.leadingAnchor.constraint(equalTo: requestTopView.leadingAnchor, constant: 27 * appConstant.widthRatio),
            
            infoBtn.trailingAnchor.constraint(equalTo: requestTopView.trailingAnchor, constant: -27 * appConstant.widthRatio),
            infoBtn.centerYAnchor.constraint(equalTo: requestTopView.centerYAnchor),
            infoBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            infoBtn.widthAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            providerImg.leadingAnchor.constraint(equalTo: requestView.leadingAnchor, constant: 14 * appConstant.widthRatio),
            providerImg.topAnchor.constraint(equalTo: requestTopView.bottomAnchor, constant: 19 * appConstant.heightRatio),
            providerImg.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            providerImg.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            providerLbl.leadingAnchor.constraint(equalTo: providerImg.trailingAnchor, constant: 9 * appConstant.widthRatio),
            providerLbl.topAnchor.constraint(equalTo: requestTopView.bottomAnchor, constant: 28 * appConstant.heightRatio),
            providerLbl.trailingAnchor.constraint(equalTo: requestView.trailingAnchor, constant: -30 * appConstant.widthRatio),
            
            providerMsgLbl.leadingAnchor.constraint(equalTo: providerImg.leadingAnchor, constant: 0 * appConstant.widthRatio),
            providerMsgLbl.topAnchor.constraint(equalTo: providerImg.bottomAnchor, constant: 6 * appConstant.heightRatio),
            providerMsgLbl.trailingAnchor.constraint(equalTo: requestView.trailingAnchor, constant: -14 * appConstant.widthRatio),
            
            rejectBtn.bottomAnchor.constraint(equalTo: requestView.bottomAnchor, constant: -20 * appConstant.heightRatio),
            rejectBtn.trailingAnchor.constraint(equalTo: requestView.trailingAnchor, constant: -35 * appConstant.widthRatio),
            rejectBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            rejectBtn.widthAnchor.constraint(equalToConstant: 110 * appConstant.heightRatio),
            
            acceptBtn.centerYAnchor.constraint(equalTo: rejectBtn.centerYAnchor),
            acceptBtn.leadingAnchor.constraint(equalTo: requestView.leadingAnchor, constant: 35 * appConstant.widthRatio),
            acceptBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            acceptBtn.widthAnchor.constraint(equalToConstant: 110 * appConstant.heightRatio),
            
            disclimerLbl.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 34 * appConstant.widthRatio),
            disclimerLbl.topAnchor.constraint(equalTo: scrollbgView.topAnchor, constant: 12 * appConstant.heightRatio),
        
            disclimerMsgLbl.leadingAnchor.constraint(equalTo: disclimerLbl.leadingAnchor),
            disclimerMsgLbl.topAnchor.constraint(equalTo: disclimerLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            disclimerMsgLbl.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -35 * appConstant.widthRatio),
            disclimerMsgLbl.bottomAnchor.constraint(equalTo: scrollbgView.bottomAnchor, constant: -12 * appConstant.heightRatio),
        ])
    }
    
    func setupShadow() {
        requestView.layer.shadowRadius = 5
        requestView.layer.shadowOpacity = 0.3
        requestView.layer.shadowColor = shadow_color().cgColor
        requestView.layer.shadowOffset = .init(width: 0, height: 0)
//        requestView.layer.borderColor = UIColor.white.cgColor
//        requestView.layer.borderWidth = 1 * appConstant.heightRatio
    }

}
