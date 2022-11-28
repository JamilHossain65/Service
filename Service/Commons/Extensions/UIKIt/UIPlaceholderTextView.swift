//
//  UIPlaceholderTextView.swift
//  NationalTM
//
//  Created by Hamza on 25/07/2022.
//

import Foundation

import UIKit

@IBDesignable class UIPlaceholderTextView: UITextView {

    var placeholderLabel = Label(text: "", font: Font.regular(15), color:  theme_gray(), alignment: .left)

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        sharedInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }

    override func prepareForInterfaceBuilder() {
        sharedInit()
    }

    func sharedInit() {
        refreshPlaceholder()
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged), name: UITextView.textDidChangeNotification, object: nil)
    }

    @IBInspectable var placeholder: String? {
        didSet {
            refreshPlaceholder()
        }
    }
    
    func refreshPlaceholder() {
            placeholderLabel = Label(text: placeholder ?? "", font: Font.regular(15), color:  theme_gray(), alignment: .left)
            self.addSubview(placeholderLabel)
            placeholderLabel.translatesAutoresizingMaskIntoConstraints = false

            placeholderLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: textContainerInset.left + 12).isActive = true
            placeholderLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: textContainerInset.right + 4).isActive = true
            placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: textContainerInset.top + 4).isActive = true
    }

    @objc func textChanged() {
        if self.placeholder?.isEmpty ?? true {
            return
        }

        UIView.animate(withDuration: 0.25) {
            if self.text.isEmpty {
                self.placeholderLabel.alpha = 1.0
            } else {
                self.placeholderLabel.alpha = 0.0
            }
        }
    }

    override var text: String! {
        didSet {
            textChanged()
        }
    }
}

public extension  UITextView{
    
    func addToolbarInputAccessoryView(toolbarHeight: CGFloat) {
        let timeCancelButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:#selector(endEditing(_:)))
        timeCancelButton.tintColor = UIColor.black
        let dateFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        let toolbar = UIToolbar()
        
        toolbar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: toolbarHeight)
        toolbar.items = [dateFlexSpace,timeCancelButton]
        toolbar.isTranslucent = true
        toolbar.barTintColor = .lightGray
        toolbar.contentMode = .right

        inputAccessoryView = toolbar
    }

}


func createTxtView(bgColor: UIColor = .clear,rad : Int = 0,placeHolder: String = "") -> UIPlaceholderTextView {
    let txtView = UIPlaceholderTextView()
    txtView.translatesAutoresizingMaskIntoConstraints = false
    txtView.backgroundColor = bgColor
    txtView.layer.cornerRadius = CGFloat(rad) * appConstant.heightRatio
    txtView.placeholder = placeHolder
    txtView.font = Font.regular()
    txtView.layer.borderColor = tf_border().cgColor
    txtView.layer.borderWidth = 1
    txtView.addToolbarInputAccessoryView(toolbarHeight: 40)
    return txtView
}



func createTF(placeHolder : String = "",bgColor:UIColor = .clear,rad:Int = 0) -> UITextField{
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.attributedPlaceholder = NSAttributedString(
        string: placeHolder,
        attributes: [NSAttributedString.Key.foregroundColor: tf_border()]
    )
    tf.backgroundColor = .clear
    tf.tintColor = .gray
    tf.textColor = .black
    tf.autocapitalizationType = .none
    tf.addToolbarInputAccessoryView(toolbarHeight: 44)
    return tf
}

public extension  UITextField{
    
    func addToolbarInputAccessoryView(toolbarHeight: CGFloat) {
        let timeCancelButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:#selector(endEditing(_:)))
        timeCancelButton.tintColor = UIColor.black
        let dateFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        let toolbar = UIToolbar()
        
        toolbar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: toolbarHeight)
        toolbar.items = [dateFlexSpace,timeCancelButton]
        toolbar.isTranslucent = true
        toolbar.barTintColor = .lightGray
        toolbar.contentMode = .right

        inputAccessoryView = toolbar
    }

}
