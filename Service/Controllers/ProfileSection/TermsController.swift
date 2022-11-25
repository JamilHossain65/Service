//
//  TermsController.swift
//  Service
//
//  Created by Hamza on 22/10/2022.
//

import UIKit

class TermsController: BaseController {
    
    lazy var termsText: UITextView = {
        let vu = UITextView()
        vu.translatesAutoresizingMaskIntoConstraints = false
        vu.backgroundColor = .clear
        vu.textAlignment = .left
        vu.font = Font.regular(16)
        vu.text = "A Terms and Conditions agreement (T&Cs) is the agreement that includes the terms, the rules and the guidelines of acceptable behavior and other useful sections to which users must agree in order to use or access your website and mobile app.\n\nThis article will get you started with creating your own custom Terms and Conditions agreement. We've also put together a Sample Terms and Conditions Template that you can use to help write your own.\n\nA Terms and Conditions agreement acts as legal contracts between you (the company) who has the website or mobile app, and the user who accesses your website/app.\n\nHaving a Terms and Conditions agreement is completely optional. No laws require you to have one. Not even the super-strict and wide-reaching General Data Protection Regulation (GDPR).\n\nYour Terms and Conditions agreement will be uniquely yours. While some clauses are standard and commonly seen in pretty much every Terms and Conditions agreement, it's up to you to set the rules and guidelines that the user must agree to."
        return vu
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        baseHeadingLbl.text = "Terms and Condition"
        searchButtomView.isHidden = true
        showBackbtn(true)
        
    }
    
    func setup() {
        childView.addSubview(termsText)
        
        NSLayoutConstraint.activate([
            termsText.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 18 * appConstant.heightRatio),
            termsText.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            termsText.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            termsText.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -8 * appConstant.heightRatio),
        ])
    }

}
