//
//  AttachCell.swift
//  TheBeats
//
//  Created by MacBook Air on 6/22/22.
//

import UIKit
import SnapKit

class AttachCell: UITableViewCell {
    lazy var attachButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24.r
        button.setImage(UIImage(named: "attachment"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(attachButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var attachTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10.r
        //textField.delegate = self
        textField.setLeftPaddingPoints(10.s)
        //textField.textColor = AppColors.placeholder
        textField.placeholder = "youtubeのリンクを貼ろう"
        //textField.setLetterSpacingBy(value: 0.6)
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var borderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var attach:Attach?
    var layoutCalled = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = AppColors.transparent
        
        [
            borderView,
            attachButton,
            attachTextField,
        ].forEach { subview in
            contentView.addSubview(subview)
        }
        
        attachButton.setTitle("", for: .normal)
        borderView.layer.borderWidth  = 1.s
        borderView.layer.cornerRadius = 20.s
        //borderView.layer.borderColor = AppColors.blue.cgColor
        
        defineLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if !layoutCalled {
            layoutCalled = true
      
            bindingView()
        }
    }

    @objc func attachButtonPressed(sender:UIButton){
        print("attachButtonPressed")
    }
    
    //MARK: - ==== BINDING VIEW ====
    private func bindingView() {
        attachTextField.tag = 1
        attachTextField.placeholder = "youtubeのリンクを貼ろう"
        //attachTextField.font = AppFonts.HiraginoSansW3(ofSize: 14.sp)
        //attachTextField.setLetterSpacingBy(value: 0.6)
    }
    
    //MARK: - ==== DEFINE LAYOUT ====
    private func defineLayout() {
        borderView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(frame.size.width)
            make.height.equalTo(40.s)
        }
        
        attachButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(0.s)
            make.leading.equalToSuperview().offset(13.s)
            make.width.equalTo(20.s)
            make.height.equalTo(20.s)
        }
        
        attachTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(0.s)
            make.leading.equalToSuperview().offset(42.s)
            make.trailing.equalToSuperview().offset(-12.s)
            make.width.equalTo(263.s)
            make.height.equalTo(25.s)
        }
    }
}
