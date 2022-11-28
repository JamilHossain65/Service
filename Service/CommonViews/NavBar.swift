//
//  NavBar.swift
//  Loop
//
//  Created by mac 2019 on 2/23/22.
//

import Foundation
import UIKit

typealias LeftIconClicked = () -> Void
typealias RightProfileClicked = () -> Void
typealias RightNotiClicked = () -> Void

final class NavBar: UIView {
    private var leftIconClicked: LeftIconClicked?
    private var rightProfileClicked: RightProfileClicked?
    private var rightNotiClicked: RightNotiClicked?
    
    private var rightProfile: UIButton!
    private var titleLbl: UILabel!
    private var title: String?
    private var rightNotiBtn: UIButton!
    private var rightNotiLbl: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(title: String?, leftIconClicked: LeftIconClicked?, rightProfileClicked: RightProfileClicked?, rightNotiClicked: RightNotiClicked?) {
        let frame = CGRect.zero
        super.init(frame: frame)
        self.frame = frame
        self.backgroundColor = AppColors.background
        
        self.leftIconClicked = leftIconClicked
        self.rightProfileClicked = rightProfileClicked
        self.rightNotiClicked = rightNotiClicked
        
        self.title = title
        
        setupUI()
    }
    
    private func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Register to receive notification in your class
    }
    
    @objc private func leftLogoPressed(sender: UIButton) {
        self.leftIconClicked?()
    }
    
    @objc private func rightProfilePressed(sender: UIButton) {
        self.rightProfileClicked?()
    }
    
    @objc private func rightNotiPressed(sender: UIButton) {
        NotificationCenter.default.post(name: .notiBadgeCangedChangedNotification, object: nil, userInfo: ["badgeCounter": 0])
        self.rightNotiClicked?()
    }
    
    @objc func changedNotificationBadge(notification: NSNotification) {
        if let badgeCounter = notification.userInfo?["badgeCounter"] as? Int {
            rightNotiLbl.isHidden = badgeCounter == 0
        }
    }
}
