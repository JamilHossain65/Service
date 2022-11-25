//
//  CustomeTextFiledView.swift
//  Service
//
//  Created by Hamza on 27/09/2022.
//

import Foundation
import UIKit

class CustomeTextFieldView: UIView {
    
    lazy var backGroundView = View(cornerRadius: 20 * appConstant.heightRatio)
    lazy var logoImg = ImageView(imageName: "user_ic")
    lazy var lineView = View(backgroundColor: tf_border())
    lazy var txtField = createTF(placeHolder: "email")
    
    var placeholder: String = "" {
        didSet {
            txtField.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [NSAttributedString.Key.foregroundColor: tf_border()]
            )
        }
    }
    
    var tfImg: String = "user_ic" {
        didSet {
            logoImg.image = UIImage(named: tfImg)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit() {
        txtField.delegate = self
        initialize_setup()
        initialize_layout()
    }
    
    func initialize_setup() {
        backGroundView.layer.borderWidth = 1 * appConstant.heightRatio
        backGroundView.layer.borderColor = tf_border().cgColor
    }
    
    func initialize_layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backGroundView)
        backGroundView.addSubview(logoImg)
        backGroundView.addSubview(lineView)
        backGroundView.addSubview(txtField)
        
        NSLayoutConstraint.activate([
            backGroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4 * appConstant.widthRatio),
            backGroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4 * appConstant.widthRatio),
            backGroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4 *  appConstant.heightRatio),
            backGroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4 * appConstant.heightRatio),
            
            logoImg.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 14 * appConstant.widthRatio),
            logoImg.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor),
            logoImg.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            logoImg.widthAnchor.constraint(equalToConstant: 24 * appConstant.widthRatio),
            
            lineView.leadingAnchor.constraint(equalTo: logoImg.trailingAnchor, constant: 14 * appConstant.widthRatio),
            lineView.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 15 * appConstant.heightRatio),
            lineView.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -15 * appConstant.heightRatio),
            lineView.widthAnchor.constraint(equalToConstant: 1 * appConstant.widthRatio),
            
            txtField.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 10 * appConstant.widthRatio),
            txtField.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -10 * appConstant.widthRatio),
            txtField.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 4 *  appConstant.heightRatio),
            txtField.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -4 * appConstant.heightRatio),
        ])
    }
}

extension CustomeTextFieldView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        backGroundView.layer.borderColor = theme_color().cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        backGroundView.layer.borderColor = tf_border().cgColor
    }
}
