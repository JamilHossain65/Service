//
//  LoaderHelper.swift
//  NationalTM
//
//  Created by Hamza on 13/08/2022.
//

import Foundation
import UIKit

class Progress{
    static var shared = Progress()
    var window: UIWindow?
    var actView: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var titleLabel: UILabel = UILabel()
    
    func showActivity(myView: UIView, myTitle: String) {
        myView.isUserInteractionEnabled = false
        myView.window?.isUserInteractionEnabled = false
        myView.endEditing(true)
        actView.frame = CGRect(x: 0, y: 0, width: myView.frame.width, height: myView.frame.height)
        actView.center = myView.center
        actView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        loadingView.center = myView.center
        loadingView.backgroundColor = .darkGray
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 15
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0);
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.color = .white
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        
        titleLabel.frame = CGRect(x: 10, y: loadingView.frame.height-45, width: loadingView.frame.width-20, height: 30)
        titleLabel.textColor = UIColor.white
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = myTitle
        
        
        loadingView.addSubview(activityIndicator)
        actView.addSubview(loadingView)
        loadingView.addSubview(titleLabel)
        myView.addSubview(actView)
        activityIndicator.startAnimating()
    }
    
    func removeActivity(myView: UIView) {
        DispatchQueue.main.async {
            myView.isUserInteractionEnabled = true
            myView.window?.isUserInteractionEnabled = true
            self.activityIndicator.stopAnimating()
            self.actView.removeFromSuperview()
        }
       
    }
}
