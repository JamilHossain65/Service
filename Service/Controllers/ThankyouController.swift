//
//  ThankyouController.swift
//  Service
//
//  Created by Hamza on 01/10/2022.
//

import UIKit

class ThankyouController: UIViewController {

    lazy var orderIdLbl = Label(text: "Order Id", font: Font.medium(16), color: .black)
    lazy var transactionTypeLbl = Label(text: "Transaction type", font: Font.medium(16), color: .black)
    lazy var transactionIdLbl = Label(text: "Transaction ID", font: Font.medium(16), color: .black)
    lazy var statuslLbl = Label(text: "Payment status", font: Font.medium(16), color: .black)
    lazy var orderIdShowLbl = Label(text: "7654321", font: Font.semiBold(18), color: .black)
    lazy var transactionTypeShowLbl = Label(text: "KNET", font: Font.semiBold(18), color: .black)
    lazy var transactionIdShowLbl = Label(text: "3800776753", font: Font.semiBold(18), color: .black)
    lazy var statusShowLbl = Label(text: "Successful", font: Font.semiBold(18), color: .black)
    lazy var headerImg = ImageView(imageName: "splash_ic")
    lazy var headingLbl = Label(text: "THANK YOU", font: Font.semiBold(20), color: .black, alignment: .center, numberOfLines: 1)
    let bgView = View(backgroundColor: theme_color(), cornerRadius: 20)
    
    lazy var okBtn = createcustomeBtn(text:  "Go to Home Page")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        view.backgroundColor = theme_color()
        bgView.layer.borderColor = UIColor.white.cgColor
        bgView.layer.borderWidth = 1 * appConstant.heightRatio
        okBtn.backgroundColor = .white
    }
    
    private func setup() {
        let margin = view.layoutMarginsGuide
        view.addSubview(headerImg)
        view.addSubview(bgView)
        bgView.addSubview(headingLbl)
        bgView.addSubview(orderIdLbl)
        bgView.addSubview(orderIdShowLbl)
        bgView.addSubview(transactionTypeLbl)
        bgView.addSubview(transactionTypeShowLbl)
        bgView.addSubview(transactionIdLbl)
        bgView.addSubview(transactionIdShowLbl)
        bgView.addSubview(statuslLbl)
        bgView.addSubview(statusShowLbl)
        view.addSubview(okBtn)
        
        NSLayoutConstraint.activate([
            headerImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerImg.widthAnchor.constraint(equalToConstant: 124 * appConstant.widthRatio),
            headerImg.heightAnchor.constraint(equalToConstant: 187 * appConstant.heightRatio),
            headerImg.topAnchor.constraint(equalTo: margin.topAnchor, constant: 60 * appConstant.heightRatio),
            
            bgView.topAnchor.constraint(equalTo: headerImg.bottomAnchor, constant: 34 * appConstant.heightRatio),
            bgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38 * appConstant.widthRatio),
            bgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38 * appConstant.widthRatio),
            bgView.heightAnchor.constraint(equalToConstant: 210 * appConstant.heightRatio),
            
            headingLbl.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 20 * appConstant.heightRatio),
            headingLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            headingLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            orderIdLbl.topAnchor.constraint(equalTo: headingLbl.bottomAnchor, constant: 14 * appConstant.heightRatio),
            orderIdLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 23 * appConstant.widthRatio),
            
            orderIdShowLbl.centerYAnchor.constraint(equalTo: orderIdLbl.centerYAnchor),
            orderIdShowLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -37 * appConstant.widthRatio),
            
            transactionTypeLbl.topAnchor.constraint(equalTo: orderIdLbl.bottomAnchor, constant: 13 * appConstant.heightRatio),
            transactionTypeLbl.leadingAnchor.constraint(equalTo: orderIdLbl.leadingAnchor),
            
            transactionTypeShowLbl.centerYAnchor.constraint(equalTo: transactionTypeLbl.centerYAnchor),
            transactionTypeShowLbl.trailingAnchor.constraint(equalTo: orderIdShowLbl.trailingAnchor),
            
            transactionIdLbl.topAnchor.constraint(equalTo: transactionTypeLbl.bottomAnchor, constant: 13 * appConstant.heightRatio),
            transactionIdLbl.leadingAnchor.constraint(equalTo: orderIdLbl.leadingAnchor),
            
            transactionIdShowLbl.centerYAnchor.constraint(equalTo: transactionIdLbl.centerYAnchor),
            transactionIdShowLbl.trailingAnchor.constraint(equalTo: orderIdShowLbl.trailingAnchor),
            
            statuslLbl.topAnchor.constraint(equalTo: transactionIdLbl.bottomAnchor, constant: 13 * appConstant.heightRatio),
            statuslLbl.leadingAnchor.constraint(equalTo: orderIdLbl.leadingAnchor),
            
            statusShowLbl.centerYAnchor.constraint(equalTo: statuslLbl.centerYAnchor),
            statusShowLbl.trailingAnchor.constraint(equalTo: orderIdShowLbl.trailingAnchor),
            
            okBtn.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -29 * appConstant.heightRatio),
            okBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 77 * appConstant.widthRatio),
            okBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -77 * appConstant.widthRatio),
            okBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
        ])
    }
}
