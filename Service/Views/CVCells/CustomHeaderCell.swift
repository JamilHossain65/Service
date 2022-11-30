//
//  CustomFooterView.swift
//  CollectionView-Header-Footer-Sample
//
//  Created by kawaharadai on 2019/05/02.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit
import SnapKit
import KMPageControl

class CustomHeaderCell: UICollectionViewCell  {
    
    override init(frame: CGRect)    {
        super.init(frame: frame)
        setupViews()
    }
    
    let titleLabel: UILabel = {
        let lbl = Label(text: "Service", font: Font.medium(16), color: .black)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let allButton: UIButton = {
        let viewAllBtn = Button(text: "View all", textColor: redText_color())
        viewAllBtn.translatesAutoresizingMaskIntoConstraints = false
        return viewAllBtn
    }()
    
    func setupViews()   {
        
        addSubview(titleLabel)
        addSubview(allButton)
       
        titleLabel.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(15.s)
            make.centerY.equalToSuperview()
        }
        
        allButton.snp.makeConstraints{make in
            make.trailing.equalToSuperview().offset(-15.s)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
