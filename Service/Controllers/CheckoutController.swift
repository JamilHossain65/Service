//
//  CheckoutController.swift
//  Service
//
//  Created by Hamza on 01/10/2022.
//

import UIKit

class CheckoutController: BaseController {
    
    lazy var requestIdLbl = Label(text: "Request ID", font: Font.medium(16), color: .black)
    lazy var subTotalLbl = Label(text: "Subtotal", font: Font.medium(16), color: .black)
    lazy var otherChargesLbl = Label(text: "Other Charges", font: Font.medium(16), color: .black)
    lazy var totalLbl = Label(text: "Total", font: Font.medium(16), color: .black)
    lazy var requestIdShowLbl = Label(text: "0.000", font: Font.semiBold(18), color: .black)
    lazy var subTotalShowLbl = Label(text: "0.000", font: Font.semiBold(18), color: .black)
    lazy var otherChargesShowLbl = Label(text: "0.000", font: Font.semiBold(18), color: .black)
    lazy var totalShowLbl = Label(text: "0.000", font: Font.semiBold(18), color: .black)
    lazy var paymentMethodLbl = Label(text: "Payment Method", font: Font.semiBold(18), color: .black)
    lazy var otherBtn = Button(imageName: "selectedCard_ic", cornerRadius: 15)
    lazy var masterCardbtn = Button(imageName: "unSelectedCard_ic", cornerRadius: 15)
    lazy var acceptbtn = Button(imageName: "tickCircle_ic", cornerRadius: 15)
    lazy var knetImg = ImageView(imageName: "knet_ic")
    lazy var visaImg = ImageView(imageName: "visa_ic")
    lazy var masterImg = ImageView(imageName: "master_ic")
    lazy var acceptlLbl = Label(text: "I accept Terms and Condition", font: Font.medium(16), color: .black)
    lazy var payNowBtn = createcustomeBtn(text: "Pay now")
    
    var isKentSelect: Bool = true {
        didSet {
            if isKentSelect {
                otherBtn.setImage(UIImage(named: "selectedCard_ic"), for: .normal)
                masterCardbtn.setImage(UIImage(named: "unSelectedCard_ic"), for: .normal)
            } else {
                otherBtn.setImage(UIImage(named: "unSelectedCard_ic"), for: .normal)
                masterCardbtn.setImage(UIImage(named: "selectedCard_ic"), for: .normal)
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        baseHeadingLbl.text = "Checkout"
        searchButtomView.isHidden = true
        showBackbtn(true)
        otherBtn.addTarget(self, action: #selector(knetBtnTapped), for: .touchUpInside)
        masterCardbtn.addTarget(self, action: #selector(visaBtnTapped), for: .touchUpInside)
        
    }
    
    private func setup() {
        childView.addSubview(requestIdLbl)
        childView.addSubview(requestIdShowLbl)
        childView.addSubview(otherChargesLbl)
        childView.addSubview(otherChargesShowLbl)
        childView.addSubview(subTotalLbl)
        childView.addSubview(subTotalShowLbl)
        childView.addSubview(totalLbl)
        childView.addSubview(totalShowLbl)
        childView.addSubview(paymentMethodLbl)
        childView.addSubview(otherBtn)
        childView.addSubview(masterCardbtn)
        childView.addSubview(knetImg)
        childView.addSubview(masterImg)
        childView.addSubview(visaImg)
        childView.addSubview(acceptbtn)
        childView.addSubview(acceptlLbl)
        childView.addSubview(payNowBtn)
        
        NSLayoutConstraint.activate([
            requestIdLbl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 41 * appConstant.heightRatio),
            requestIdLbl.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 37 * appConstant.widthRatio),
            
            requestIdShowLbl.centerYAnchor.constraint(equalTo: requestIdLbl.centerYAnchor),
            requestIdShowLbl.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -37 * appConstant.widthRatio),
            
            subTotalLbl.topAnchor.constraint(equalTo: requestIdLbl.bottomAnchor, constant: 13 * appConstant.heightRatio),
            subTotalLbl.leadingAnchor.constraint(equalTo: requestIdLbl.leadingAnchor),
            
            subTotalShowLbl.centerYAnchor.constraint(equalTo: subTotalLbl.centerYAnchor),
            subTotalShowLbl.trailingAnchor.constraint(equalTo: requestIdShowLbl.trailingAnchor),
            
            otherChargesLbl.topAnchor.constraint(equalTo: subTotalLbl.bottomAnchor, constant: 13 * appConstant.heightRatio),
            otherChargesLbl.leadingAnchor.constraint(equalTo: requestIdLbl.leadingAnchor),
            
            otherChargesShowLbl.centerYAnchor.constraint(equalTo: otherChargesLbl.centerYAnchor),
            otherChargesShowLbl.trailingAnchor.constraint(equalTo: requestIdShowLbl.trailingAnchor),
            
            totalLbl.topAnchor.constraint(equalTo: otherChargesLbl.bottomAnchor, constant: 13 * appConstant.heightRatio),
            totalLbl.leadingAnchor.constraint(equalTo: requestIdLbl.leadingAnchor),
            
            totalShowLbl.centerYAnchor.constraint(equalTo: totalLbl.centerYAnchor),
            totalShowLbl.trailingAnchor.constraint(equalTo: requestIdShowLbl.trailingAnchor),
            
            paymentMethodLbl.topAnchor.constraint(equalTo: totalShowLbl.bottomAnchor, constant: 40 * appConstant.heightRatio),
            paymentMethodLbl.leadingAnchor.constraint(equalTo: requestIdLbl.leadingAnchor),
            
            otherBtn.leadingAnchor.constraint(equalTo: paymentMethodLbl.leadingAnchor),
            otherBtn.topAnchor.constraint(equalTo: paymentMethodLbl.bottomAnchor, constant: 26 * appConstant.heightRatio),
            otherBtn.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            otherBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            knetImg.leadingAnchor.constraint(equalTo: otherBtn.trailingAnchor, constant: 20 * appConstant.widthRatio),
            knetImg.centerYAnchor.constraint(equalTo: otherBtn.centerYAnchor),
            knetImg.widthAnchor.constraint(equalToConstant: 56 * appConstant.widthRatio),
            knetImg.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            masterCardbtn.leadingAnchor.constraint(equalTo: paymentMethodLbl.leadingAnchor),
            masterCardbtn.topAnchor.constraint(equalTo: otherBtn.bottomAnchor, constant: 36 * appConstant.heightRatio),
            masterCardbtn.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            masterCardbtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            visaImg.leadingAnchor.constraint(equalTo: masterCardbtn.trailingAnchor, constant: 20 * appConstant.widthRatio),
            visaImg.centerYAnchor.constraint(equalTo: masterCardbtn.centerYAnchor),
            visaImg.widthAnchor.constraint(equalToConstant: 56 * appConstant.widthRatio),
            visaImg.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            masterImg.leadingAnchor.constraint(equalTo: visaImg.trailingAnchor, constant: 20 * appConstant.widthRatio),
            masterImg.centerYAnchor.constraint(equalTo: masterCardbtn.centerYAnchor),
            masterImg.widthAnchor.constraint(equalToConstant: 56 * appConstant.widthRatio),
            masterImg.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            acceptbtn.leadingAnchor.constraint(equalTo: paymentMethodLbl.leadingAnchor),
            acceptbtn.topAnchor.constraint(equalTo: masterCardbtn.bottomAnchor, constant: 40 * appConstant.heightRatio),
            acceptbtn.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            acceptbtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            acceptlLbl.leadingAnchor.constraint(equalTo: acceptbtn.trailingAnchor, constant: 20 * appConstant.widthRatio),
            acceptlLbl.centerYAnchor.constraint(equalTo: acceptbtn.centerYAnchor),
            
            payNowBtn.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -29 * appConstant.heightRatio),
            payNowBtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 77 * appConstant.widthRatio),
            payNowBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -77 * appConstant.widthRatio),
            payNowBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
        ])
    }
    
}

extension CheckoutController {
    
    @objc func knetBtnTapped() {
        isKentSelect = true
    }
    
    @objc func visaBtnTapped() {
        isKentSelect = false
    }
}
