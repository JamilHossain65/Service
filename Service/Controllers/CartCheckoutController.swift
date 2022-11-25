//
//  CartCheckoutController.swift
//  Service
//
//  Created by Hamza on 11/11/2022.
//01947901123503

import UIKit

class CartCheckoutController: BaseController {
    
    lazy var scrollbgView =  View()
    lazy var scrollView = UIScrollView()
    
    lazy var summryLbl = Label(text: "Summry", font: Font.semiBold(18), color: .black)
    lazy var cartTotalLbl = Label(text: "Cart Total", font: Font.medium(16), color: .black)
    lazy var subTotalLbl = Label(text: "Subtotal", font: Font.medium(16), color: .black)
    lazy var deliveryChargesLbl = Label(text: "Delivery Charges", font: Font.medium(16), color: .black)
    lazy var discountLbl = Label(text: "Discount", font: Font.medium(16), color: redText_color())
    lazy var totalLbl = Label(text: "Grand Total", font: Font.bold(16), color: .black)
    lazy var cartTotalShowLbl = Label(text: "0.000", font: Font.semiBold(18), color: .black)
    lazy var subTotalShowLbl = Label(text: "0.000", font: Font.semiBold(18), color: .black)
    lazy var deliveryChargesShowLbl = Label(text: "0.000", font: Font.semiBold(18), color: .black)
    lazy var discountShowLbl = Label(text: "0.000", font: Font.semiBold(18), color: redText_color())
    lazy var totalShowLbl = Label(text: "0.000", font: Font.bold(16), color: .black)
    lazy var deliveryAddresLbl = Label(text: "Delivery Address", font: Font.semiBold(18), color: .black)
    lazy var addresLbl = Label(text: "Home", font: Font.regular(14), color: .black, alignment: .left)
    lazy var addresDetailLbl = Label(text: "Hawally Salmiya, Block 4, Street 3, House no. 4 Direction: Call me when you reach nearby", font: Font.regular(14), color: .black, alignment: .left, numberOfLines: 3)
    lazy var paymentMethodLbl = Label(text: "Payment Method", font: Font.semiBold(18), color: .black)
    lazy var otherBtn = Button(imageName: "selectedCard_ic", cornerRadius: 15)
    lazy var masterCardbtn = Button(imageName: "unSelectedCard_ic", cornerRadius: 15)
    lazy var acceptbtn = Button(imageName: "tickCircle_ic", cornerRadius: 15)
    lazy var knetImg = ImageView(imageName: "knet_ic")
    lazy var visaImg = ImageView(imageName: "visa_ic")
    lazy var masterImg = ImageView(imageName: "master_ic")
    lazy var acceptlLbl = Label(text: "I accept Terms and Condition", font: Font.medium(16), color: .black)
    lazy var payNowBtn = createcustomeBtn(text: "Pay now")
    lazy var coupnView = View(backgroundColor: .white, cornerRadius: 20, boarderColor: UIColor.black.cgColor , boarderWidth: 1)
    lazy var applyBtn = createcustomeBtn(text: "Apply")
    lazy var coupnTF = createTF(placeHolder: "Enter Coupon Code")
    

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
    
    var cartParice: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        scrollbgView.backgroundColor = viewController_color()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        baseHeadingLbl.text = "Checkout"
        searchButtomView.isHidden = true
        showBackbtn(true)
        otherBtn.addTarget(self, action: #selector(knetBtnTapped), for: .touchUpInside)
        masterCardbtn.addTarget(self, action: #selector(visaBtnTapped), for: .touchUpInside)
        setupData()
    }
    
    private func setup() {
        childView.addSubview(scrollView)
        scrollView.addSubview(scrollbgView)
        scrollbgView.addSubview(summryLbl)
        scrollbgView.addSubview(cartTotalLbl)
        scrollbgView.addSubview(cartTotalShowLbl)
        scrollbgView.addSubview(deliveryChargesLbl)
        scrollbgView.addSubview(deliveryChargesShowLbl)
        scrollbgView.addSubview(subTotalLbl)
        scrollbgView.addSubview(subTotalShowLbl)
        scrollbgView.addSubview(coupnView)
        coupnView.addSubview(applyBtn)
        coupnView.addSubview(coupnTF)
        scrollbgView.addSubview(discountLbl)
        scrollbgView.addSubview(discountShowLbl)
        scrollbgView.addSubview(totalLbl)
        scrollbgView.addSubview(totalShowLbl)
        scrollbgView.addSubview(deliveryAddresLbl)
        scrollbgView.addSubview(addresLbl)
        scrollbgView.addSubview(addresDetailLbl)
        scrollbgView.addSubview(paymentMethodLbl)
        scrollbgView.addSubview(otherBtn)
        scrollbgView.addSubview(masterCardbtn)
        scrollbgView.addSubview(knetImg)
        scrollbgView.addSubview(masterImg)
        scrollbgView.addSubview(visaImg)
        scrollbgView.addSubview(acceptbtn)
        scrollbgView.addSubview(acceptlLbl)
        scrollbgView.addSubview(payNowBtn)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: childView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: childView.bottomAnchor),
            scrollView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),
            
            scrollbgView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60 * appConstant.heightRatio),
            scrollbgView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollbgView.trailingAnchor.constraint(equalTo:scrollView.trailingAnchor),
            scrollbgView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollbgView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),
            
            summryLbl.topAnchor.constraint(equalTo: scrollbgView.topAnchor, constant: 20 * appConstant.heightRatio),
            summryLbl.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 37 * appConstant.widthRatio),
            
            
            cartTotalLbl.topAnchor.constraint(equalTo: summryLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            cartTotalLbl.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 37 * appConstant.widthRatio),
            
            cartTotalShowLbl.centerYAnchor.constraint(equalTo: cartTotalLbl.centerYAnchor),
            cartTotalShowLbl.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -37 * appConstant.widthRatio),
            
            deliveryChargesLbl.topAnchor.constraint(equalTo: cartTotalShowLbl.bottomAnchor, constant: 13 * appConstant.heightRatio),
            deliveryChargesLbl.leadingAnchor.constraint(equalTo: cartTotalLbl.leadingAnchor),
            
            deliveryChargesShowLbl.centerYAnchor.constraint(equalTo: deliveryChargesLbl.centerYAnchor),
            deliveryChargesShowLbl.trailingAnchor.constraint(equalTo: cartTotalShowLbl.trailingAnchor),
            
            subTotalLbl.topAnchor.constraint(equalTo: deliveryChargesShowLbl.bottomAnchor, constant: 13 * appConstant.heightRatio),
            subTotalLbl.leadingAnchor.constraint(equalTo: cartTotalLbl.leadingAnchor),
            
            subTotalShowLbl.centerYAnchor.constraint(equalTo: subTotalLbl.centerYAnchor),
            subTotalShowLbl.trailingAnchor.constraint(equalTo: cartTotalShowLbl.trailingAnchor),
            
            coupnView.topAnchor.constraint(equalTo: subTotalShowLbl.bottomAnchor, constant: 29 * appConstant.heightRatio),
            coupnView.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            coupnView.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            coupnView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            applyBtn.trailingAnchor.constraint(equalTo: coupnView.trailingAnchor),
            applyBtn.topAnchor.constraint(equalTo: coupnView.topAnchor),
            applyBtn.bottomAnchor.constraint(equalTo: coupnView.bottomAnchor),
            applyBtn.widthAnchor.constraint(equalToConstant: 100 * appConstant.widthRatio),
            
            coupnTF.trailingAnchor.constraint(equalTo: applyBtn.leadingAnchor, constant: -12 * appConstant.widthRatio),
            coupnTF.topAnchor.constraint(equalTo: coupnView.topAnchor, constant: 4 * appConstant.heightRatio),
            coupnTF.bottomAnchor.constraint(equalTo: coupnView.bottomAnchor, constant: -4 * appConstant.heightRatio),
            coupnTF.leadingAnchor.constraint(equalTo: coupnView.leadingAnchor, constant: 12 * appConstant.widthRatio),
            
            discountLbl.topAnchor.constraint(equalTo: coupnView.bottomAnchor, constant: 13 * appConstant.heightRatio),
            discountLbl.leadingAnchor.constraint(equalTo: cartTotalLbl.leadingAnchor),
            
            discountShowLbl.centerYAnchor.constraint(equalTo: discountLbl.centerYAnchor),
            discountShowLbl.trailingAnchor.constraint(equalTo: cartTotalShowLbl.trailingAnchor),
            
            totalLbl.topAnchor.constraint(equalTo: discountShowLbl.bottomAnchor, constant: 13 * appConstant.heightRatio),
            totalLbl.leadingAnchor.constraint(equalTo: cartTotalLbl.leadingAnchor),
            
            totalShowLbl.centerYAnchor.constraint(equalTo: totalLbl.centerYAnchor),
            totalShowLbl.trailingAnchor.constraint(equalTo: cartTotalShowLbl.trailingAnchor),
            
            deliveryAddresLbl.topAnchor.constraint(equalTo: totalShowLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            deliveryAddresLbl.leadingAnchor.constraint(equalTo: cartTotalLbl.leadingAnchor),
            
            addresLbl.topAnchor.constraint(equalTo: deliveryAddresLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            addresLbl.leadingAnchor.constraint(equalTo: cartTotalLbl.leadingAnchor),
            addresLbl.trailingAnchor.constraint(equalTo: cartTotalShowLbl.trailingAnchor),
            
            addresDetailLbl.topAnchor.constraint(equalTo: addresLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            addresDetailLbl.leadingAnchor.constraint(equalTo: cartTotalLbl.leadingAnchor),
            addresDetailLbl.trailingAnchor.constraint(equalTo: cartTotalShowLbl.trailingAnchor),
            
            paymentMethodLbl.topAnchor.constraint(equalTo: addresDetailLbl.bottomAnchor, constant: 40 * appConstant.heightRatio),
            paymentMethodLbl.leadingAnchor.constraint(equalTo: cartTotalLbl.leadingAnchor),
            
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
            
            payNowBtn.topAnchor.constraint(equalTo: acceptlLbl.bottomAnchor, constant: 50 * appConstant.heightRatio),
            payNowBtn.bottomAnchor.constraint(equalTo: scrollbgView.bottomAnchor, constant: -29 * appConstant.heightRatio),
            payNowBtn.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 77 * appConstant.widthRatio),
            payNowBtn.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -77 * appConstant.widthRatio),
            payNowBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
        ])
    }
    
    func setupData() {
        cartTotalShowLbl.text = "\(cartParice ?? 0) KD"
        totalShowLbl.text = "\(cartParice ?? 0) KD"
    }
    
}

extension CartCheckoutController {
    
    @objc func knetBtnTapped() {
        isKentSelect = true
    }
    
    @objc func visaBtnTapped() {
        isKentSelect = false
    }
}
