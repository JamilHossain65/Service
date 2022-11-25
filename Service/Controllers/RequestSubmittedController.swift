//
//  RequestSubmittedController.swift
//  Service
//
//  Created by Hamza on 01/10/2022.
//

import UIKit

class RequestSubmittedController: UIViewController {

    lazy var headerImg = ImageView(imageName: "splash_ic")
    let bgView = View(backgroundColor: theme_color(), cornerRadius: 20)
    lazy var headingLbl = Label(text: "Request submitted", font: Font.semiBold(20), color: .black, alignment: .center, numberOfLines: 1)
    lazy var descLbl = Label(text: "You can follow up your order from the My order Page", font: Font.medium(16), color: .black, alignment: .center, numberOfLines: 0)
    lazy var okBtn = createcustomeBtn(text:  "OK")
    
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
        okBtn.addTarget(self, action: #selector(okBtnTapped), for: .touchUpInside)
    }
    
    private func setup() {
        let margin = view.layoutMarginsGuide
        view.addSubview(headerImg)
        view.addSubview(bgView)
        bgView.addSubview(headingLbl)
        bgView.addSubview(descLbl)
        view.addSubview(okBtn)
        
        NSLayoutConstraint.activate([
            headerImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerImg.widthAnchor.constraint(equalToConstant: 124 * appConstant.widthRatio),
            headerImg.heightAnchor.constraint(equalToConstant: 187 * appConstant.heightRatio),
            headerImg.topAnchor.constraint(equalTo: margin.topAnchor, constant: 60 * appConstant.heightRatio),
            
            bgView.topAnchor.constraint(equalTo: headerImg.bottomAnchor, constant: 54 * appConstant.heightRatio),
            bgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38 * appConstant.widthRatio),
            bgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38 * appConstant.widthRatio),
            bgView.heightAnchor.constraint(equalToConstant: 173 * appConstant.heightRatio),
            
            headingLbl.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 20 * appConstant.heightRatio),
            headingLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            headingLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            descLbl.topAnchor.constraint(equalTo: headingLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            descLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            descLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            okBtn.topAnchor.constraint(equalTo: bgView.bottomAnchor, constant: 39 * appConstant.heightRatio),
            okBtn.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 38 * appConstant.widthRatio),
            okBtn.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -38 * appConstant.widthRatio),
            okBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
        ])
    }
    
    @objc func okBtnTapped() {
        self.setRootVC(CustomTabbarController())
    }
    
}
