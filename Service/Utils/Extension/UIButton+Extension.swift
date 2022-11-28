//
//  UIButton+Extension.swift
//  TheBeats
//
//  Created by mac 2019 on 8/15/22.
//

import Foundation
import UIKit

extension UIButton {
    func setEnabled(enabled: Bool) {
        self.isEnabled = enabled
        self.backgroundColor = enabled ? .primaryColor : .disabledButtonColor
        self.setTitleColor(enabled ? .white : .disabledButtonTitleColor, for: .normal)
    }
}
