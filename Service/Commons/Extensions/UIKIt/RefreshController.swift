//
//  RefreshController.swift
//  WallsPy
//
//  Created by Daniyal Shafiq on 28/04/2022.
//  Copyright © 2022 367 Labs. All rights reserved.
//

import UIKit


class RefreshController: UIRefreshControl {
    
    var didReloadData: (() -> ())?
    
    private var offset: CGFloat = 0.0
    
    
    required init(offset: CGFloat = 0.0) {
        super.init(frame: .zero)
        self.offset = offset
        
        tintColor = theme_color()
        addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    
    override var frame: CGRect {
        set {
            var rect = newValue
            rect.origin.y += offset
            super.frame = rect
        }
        get {
            return super.frame
        }
    }
    
    @objc func loadData() {
        self.didReloadData?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
}
