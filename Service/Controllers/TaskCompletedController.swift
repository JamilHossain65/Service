//
//  TaskCompletedController.swift
//  Service
//
//  Created by Hamza on 30/09/2022.
//

import UIKit

class TaskCompletedController: UIViewController {

    lazy var headerImg = ImageView(imageName: "splash_ic")
    let bgView = View(backgroundColor: theme_color(), cornerRadius: 20)
    lazy var headingLbl = Label(text: "TASK COMPLETED", font: Font.semiBold(20), color: .black, alignment: .center, numberOfLines: 1)
    lazy var subHeadingLbl = Label(text: "Your service has been provided!", font: Font.semiBold(16), color: .black, alignment: .center, numberOfLines: 1)
    lazy var descLbl = Label(text: "Technician Services Repair AC, Air Conditioners and All Electronic COMPUTER REPAIRS , WIRELESS SYSTEMS, HOME SECURITY SYSTEMS.", font: Font.medium(12), color: .black, alignment: .center, numberOfLines: 0)
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
        okBtn.addTarget(self, action: #selector(backbtnTapped), for: .touchUpInside)
    }
    
    private func setup() {
        let margin = view.layoutMarginsGuide
        view.addSubview(headerImg)
        view.addSubview(bgView)
        bgView.addSubview(headingLbl)
        bgView.addSubview(subHeadingLbl)
        bgView.addSubview(descLbl)
        bgView.addSubview(okBtn)
        
        NSLayoutConstraint.activate([
            headerImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerImg.widthAnchor.constraint(equalToConstant: 124 * appConstant.widthRatio),
            headerImg.heightAnchor.constraint(equalToConstant: 187 * appConstant.heightRatio),
            headerImg.topAnchor.constraint(equalTo: margin.topAnchor, constant: 60 * appConstant.heightRatio),
            
            bgView.topAnchor.constraint(equalTo: headerImg.bottomAnchor, constant: 54 * appConstant.heightRatio),
            bgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38 * appConstant.widthRatio),
            bgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38 * appConstant.widthRatio),
            bgView.heightAnchor.constraint(equalToConstant: 280 * appConstant.heightRatio),
            
            headingLbl.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 20 * appConstant.heightRatio),
            headingLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            headingLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            subHeadingLbl.topAnchor.constraint(equalTo: headingLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            subHeadingLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            subHeadingLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            descLbl.topAnchor.constraint(equalTo: subHeadingLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            descLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            descLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            okBtn.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -29 * appConstant.heightRatio),
            okBtn.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 38 * appConstant.widthRatio),
            okBtn.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -38 * appConstant.widthRatio),
            okBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
        ])
    }
    
    @objc func backbtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
