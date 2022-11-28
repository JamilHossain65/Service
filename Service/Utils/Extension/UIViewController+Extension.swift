//
//  UIViewController+Extension.swift
//  TheBeats
//
//  Created by mac 2019 on 8/29/22.
//

import Foundation
import UIKit

extension UIViewController {
    func setTopBar(height: CGFloat, title: String?, rightBtnTitle: String? = nil) {
        let containerView = UIView.createView()
        containerView.backgroundColor = .white
        self.view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(height)
        }
        
        let backBtn = UIView.createButton(imageName: .backBlack)
        backBtn.addTarget(self, action: #selector(topBarBackClicked), for: .touchUpInside)
        containerView.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.leading.equalTo(containerView.snp.leading).offset(23.s)
            make.bottom.equalTo(containerView.snp.bottom).offset(-14.s)
        }
        
        let titleLbl = UIView.createLabel(title)
        titleLbl.textColor = .primaryColor
        titleLbl.textAlignment = .center
        titleLbl.numberOfLines = 0
        titleLbl.font = AppFonts.HiraginoSansW6(ofSize: 22.sp)
        titleLbl.letterSpacing(spacing: 2.1)
        titleLbl.setLineHeight(lineHeight: 1.5)
        containerView.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(0.s)
            make.bottom.equalTo(containerView.snp.bottom).offset(-10.s)
        }
        
        if let rightBtnTitle = rightBtnTitle {
            let confirmBtn = UIView.createButton(title: rightBtnTitle)
            confirmBtn.setTitleColor(UIColor.primaryColor, for: .normal)
            confirmBtn.titleLabel?.font = AppFonts.HiraginoSansW6(ofSize: 16.sp)
            confirmBtn.addTarget(self, action: #selector(topBarConfirmClicked), for: .touchUpInside)
            containerView.addSubview(confirmBtn)
            confirmBtn.snp.makeConstraints { make in
                make.trailing.equalTo(containerView.snp.trailing).offset(-20.s)
                make.bottom.equalTo(containerView.snp.bottom).offset(-10.s)
            }
        }
    }
    
    @objc func topBarBackClicked() {
        
    }
    
    @objc func topBarConfirmClicked() {
        
    }
}
