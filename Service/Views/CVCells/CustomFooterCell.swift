//
//  CustomHeaderView.swift
//  CollectionView-Header-Footer-Sample
//
//  Created by kawaharadai on 2019/05/02.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit
import SnapKit
import KMPageControl

class CustomFooterCell: UICollectionViewCell  {
    
    override init(frame: CGRect)    {
        super.init(frame: frame)
        setupViews()
    }

    var pageControl: KMPageControl = {
        let control = KMPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.activeSize    = CGSize(width: 30, height: 10)
        control.inactiveSize  = CGSize(width: 10, height: 10)
        control.activeColor   = theme_color()
        control.inactiveColor = theme_gray()
        control.currentPage   = 0
        return control
    }()
    func setupViews()   {
        addSubview(pageControl)
       
        pageControl.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints{make in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
