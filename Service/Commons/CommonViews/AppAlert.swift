//
//  AppAlert.swift
//  TheBeats
//
//  Created by mac 2019 on 8/30/22.
//

import Foundation
import UIKit
import SnapKit

class AppAlert: UIView {
    private let containerView: UIView = {
        let view = UIView.createView()
        view.backgroundColor = .white
        view.round(radius: 20.s)
        return view
    }()
    
    private let titleLbl: UILabel = {
        let label = UIView.createLabel()
        label.textColor = AppColors.grayText33
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = AppFonts.BarlowMedium(ofSize: 14.sp)
        label.setLineHeight(lineHeight: 1.0)
        return label
    }()
    
    private lazy var cancelBtn: UIButton = {
        let button = UIView.createButton(title: .translate_id_1052)
        button.backgroundColor = AppColors.graye8
        button.setTitleColor(AppColors.gray9d, for: .normal)
        button.titleLabel?.font = AppFonts.HiraginoSansW3(ofSize: 14.sp)
        button.round(radius: 24.s)
        button.addTarget(self, action: #selector(cancelBtnClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var confirmBtn: UIButton = {
        let button = UIView.createButton(title: .translate_id_1052)
        button.backgroundColor = .primaryColor
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = AppFonts.HiraginoSansW3(ofSize: 14.sp)
        button.round(radius: 24.s)
        button.addTarget(self, action: #selector(confirmBtnClicked), for: .touchUpInside)
        return button
    }()
    
    private var alertSize: CGSize!
    private var confirmBlock: (() -> Void)?
    
    init(size: CGSize) {
        super.init(frame: CGRect(x: 0, y: 0, width: SizeConfig.screenWidth, height: SizeConfig.screenHeight))
        alertSize = size
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        self.backgroundColor = .black.withAlphaComponent(0.3)
        self.addSubview(containerView)
        
        [titleLbl, cancelBtn, confirmBtn].forEach { view in
            self.containerView.addSubview(view)
        }
        
        defineLayout()
    }
    
    private func defineLayout() {
        containerView.snp.makeConstraints { make in
            make.height.equalTo(alertSize.height)
            make.width.equalTo(alertSize.width)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        titleLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20.s)
            make.centerX.equalToSuperview()
        }
        cancelBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20.s)
            make.centerX.equalToSuperview().offset(-80.s)
            make.height.equalTo(48.s)
            make.width.equalTo(140.s)
        }
        confirmBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20.s)
            make.centerX.equalToSuperview().offset(80.s)
            make.height.equalTo(48.s)
            make.width.equalTo(140.s)
        }
    }
    
    public func show(title: String?, confirmed: (() -> Void)? = nil) {
        confirmBlock = confirmed
        titleLbl.text = title
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window {
//            window.addSubview(self)
//        }
    }
    
    private func hide() {
        self.removeFromSuperview()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != containerView {
            self.hide()
        }
    }
    
    @objc func cancelBtnClicked(sender: UIButton) {
        hide()
    }
    
    @objc func confirmBtnClicked(sender: UIButton) {
        hide()
        confirmBlock?()
    }
}
