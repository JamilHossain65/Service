//
//  TextFieldwithButtonView.swift
//  Service
//
//  Created by Hamza on 08/10/2022.
//

import Foundation
import UIKit

class TextFieldwithButtonView: UIView {
    
    lazy var backGroundView = View(cornerRadius: 20 * appConstant.heightRatio)
    lazy var sendImg = ImageView(imageName: "chatSend_ic",contentMode: .scaleAspectFit, clipsToBound: true)
    lazy var sendBtn = Button(imageName: "")
    lazy var txtField = createTF(placeHolder: "email")
    
    var placeholder: String = "" {
        didSet {
            txtField.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [NSAttributedString.Key.foregroundColor: tf_border()]
            )
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
        backGroundView.addSubview(sendImg)
        backGroundView.addSubview(sendBtn)
        backGroundView.addSubview(txtField)
        
        NSLayoutConstraint.activate([
            backGroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0 * appConstant.widthRatio),
            backGroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -0 * appConstant.widthRatio),
            backGroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0 *  appConstant.heightRatio),
            backGroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            sendImg.leadingAnchor.constraint(equalTo: sendBtn.leadingAnchor, constant: 0 * appConstant.widthRatio),
            sendImg.trailingAnchor.constraint(equalTo: sendBtn.trailingAnchor, constant: 0 * appConstant.widthRatio),
            sendImg.topAnchor.constraint(equalTo: sendBtn.topAnchor, constant: 0 *  appConstant.heightRatio),
            sendImg.bottomAnchor.constraint(equalTo: sendBtn.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            sendBtn.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -10 * appConstant.widthRatio),
            sendBtn.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor),
            sendBtn.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            sendBtn.widthAnchor.constraint(equalToConstant: 24 * appConstant.widthRatio),
            
            txtField.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 10 * appConstant.widthRatio),
            txtField.trailingAnchor.constraint(equalTo: sendBtn.leadingAnchor, constant: -10 * appConstant.widthRatio),
            txtField.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 4 *  appConstant.heightRatio),
            txtField.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -4 * appConstant.heightRatio),
        ])
    }
}

extension TextFieldwithButtonView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        backGroundView.layer.borderColor = UIColor.black.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        backGroundView.layer.borderColor = tf_border().cgColor
    }
}
