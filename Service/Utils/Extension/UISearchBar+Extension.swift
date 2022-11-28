//
//  UISearchBar+Extension.swift
//  TheBeats
//
//  Created by Bd Stock Air-M on 28/9/22.
//

import UIKit

extension UISearchBar {
    public var textField: UITextField? {
        return searchTextField
    }
    
    public var activityIndicator: UIActivityIndicatorView? {
        return textField?.leftView?.subviews.compactMap { $0 as? UIActivityIndicatorView }.first
    }
    
    var isLoading: Bool {
        get {
            return activityIndicator != nil
        } set {
            if newValue {
                if activityIndicator == nil {
                    let newActivityIndicator = UIActivityIndicatorView(style: .medium)
                    newActivityIndicator.color = UIColor.gray
                    newActivityIndicator.startAnimating()
                    newActivityIndicator.backgroundColor = textField?.backgroundColor ?? UIColor.white
                    textField?.leftView?.addSubview(newActivityIndicator)
                    let leftViewSize = textField?.leftView?.frame.size ?? CGSize.zero
                    
                    newActivityIndicator.center = CGPoint(x: leftViewSize.width - newActivityIndicator.frame.width / 2,
                                                          y: leftViewSize.height / 2)
                }
            } else {
                activityIndicator?.removeFromSuperview()
            }
        }
    }
    
    func setSearchText(fontSize: CGFloat) {
        let font = searchTextField.font
        searchTextField.font = font?.withSize(fontSize)
    }
    
    func setupSearchBar(background: UIColor = .white, inputText: UIColor = .black, placeholderText: UIColor = .gray, imageColor: UIColor = .black, height: CGFloat = 30.0, radius: CGFloat = 10) {
        
        self.searchBarStyle = .minimal
        self.barStyle = .default
        
        let image: UIImage? = UIImage.imageWithColor(color: UIColor.clear, size: CGSize(width: 1, height: height))
        setSearchFieldBackgroundImage(image, for: .normal)
        
        searchTextField.backgroundColor = background
        searchTextField.textColor = inputText
        searchTextField.layer.cornerRadius = radius
        searchTextField.layer.masksToBounds = true
        searchTextField.attributedPlaceholder = NSAttributedString(string: searchTextField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeholderText])
        
        if let leftView = searchTextField.leftView as? UIImageView {
            leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
            leftView.tintColor = imageColor
        }
    }
    
    func removeLeftView() {
        setImage(UIImage(), for: .search, state: .normal)
    }
}
