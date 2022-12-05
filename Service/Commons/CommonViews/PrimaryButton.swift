//
//  PrimaryButton.swift
//  Hinatabo
//
//  Created by mac 2019 on 2/18/21.
//

import UIKit

class PrimaryButton: UIButton {
    var isCircular: Bool = false {
        didSet {
            initializeSetup()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame:frame)
        
        initializeSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        initializeSetup()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    private func initializeSetup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        //self.addGradient(_colors: [AppColors.gray.cgColor, AppColors.buttonGradient2.cgColor], _locations: [0.0, 1.0], _gradientMode: .horizontal)
        self.titleLabel?.font = isCircular ? AppFonts.BarlowMedium(ofSize: 16.sp) : AppFonts.BarlowMedium(ofSize: 16.sp)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.letterSpacing(spacing: isCircular ? 2.0 : 0.0)
        if isCircular {
            self.roundWithShadow(_cornerRadius: self.bounds.size.height/2.0, _x: 0, _y: 0, _blar: 14, _shadowColor: AppColors.gray.withAlphaComponent(0.8))
        }
        else {
            self.round(radius: 5.s)
        }
        
    }
}
