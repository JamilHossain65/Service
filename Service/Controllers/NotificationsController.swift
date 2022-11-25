//
//  NotificationsController.swift
//  Service
//
//  Created by Hamza on 07/10/2022.
//

import UIKit
import WMSegmentControl

class NotificationsController: BaseController {
    
    lazy var topView = View(backgroundColor: .clear,cornerRadius: 30 * appConstant.heightRatio)
    let segment = WMSegment()
    lazy var qutationView = QutationView()
    lazy var newRequestView = NewRequestView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        initUI()
    }
    
    private func initUI() {
        setupSegmentControl()
        searchButtomView.isHidden = true
        showBackbtn(true)
        baseHeadingLbl.text = "Notifications"
        qutationView.isHidden = false
        newRequestView.isHidden = true
    }
    
    func setupSegmentControl() {
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.type = .normal
        segment.selectorType = .normal
        segment.isRounded = true
        segment.buttonTitles = "Quotation,New Requests"
        segment.textColor = .black
        segment.selectorTextColor = .black
        segment.selectorColor = theme_color()
        segment.SelectedFont = Font.semiBold()
        segment.normalFont = Font.regular()
        
        segment.onValueChanged = { index in
            if index == 0 {
                self.qutationView.isHidden = false
                self.newRequestView.isHidden = true
            } else {
                self.qutationView.isHidden  = true
                self.newRequestView.isHidden  = false
            }
        }
        
    }
    
    private func setup() {
        childView.addSubview(topView)
        topView.addSubview(segment)
        childView.addSubview(qutationView)
        childView.addSubview(newRequestView)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: headerImg.bottomAnchor, constant: 12 * appConstant.heightRatio),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18 * appConstant.widthRatio),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18 * appConstant.widthRatio),
            topView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            segment.topAnchor.constraint(equalTo: topView.topAnchor, constant: 8 * appConstant.heightRatio),
            segment.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 8 * appConstant.widthRatio),
            segment.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8 * appConstant.widthRatio),
            segment.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -8 * appConstant.heightRatio),
            
            qutationView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 8 * appConstant.heightRatio),
            qutationView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            qutationView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            qutationView.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            newRequestView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 8 * appConstant.heightRatio),
            newRequestView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            newRequestView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            newRequestView.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: 0 * appConstant.heightRatio),
        ])
    }
    
}
