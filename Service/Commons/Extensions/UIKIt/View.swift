//
//  View.swift
//  WallsPy
//
//  Created by Daniyal Shafiq on 20/04/2022.
//  Copyright © 2022 367 Labs. All rights reserved.
//


import UIKit
class View: UIView {
    required init(backgroundColor: UIColor = UIColor.white, cornerRadius: CGFloat = 0, boarderColor: CGColor = UIColor.clear.cgColor, boarderWidth: Int = 0) {
        super.init(frame: .zero)
        super.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = boarderColor
        self.layer.borderWidth = CGFloat(boarderWidth)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

func createcustomeBtn(text: String, font: UIFont = Font.semiBold(16), cornerRadius: Int = 20, bgColor: UIColor = theme_color()) -> CustomButton {
    let btn = CustomButton()
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.setTitle(text, for: .normal)
    btn.titleLabel?.font = font
    btn.cornerRadius = cornerRadius
    btn.backgroundColor = bgColor
    return btn
}


func createStack(axis: NSLayoutConstraint.Axis = .horizontal,distribution: UIStackView.Distribution = .fillEqually,spaceing: Int = 8,alignment:UIStackView.Alignment = .center) -> UIStackView {
    let sv = UIStackView()
    sv.axis  = axis
    sv.distribution  = distribution
    sv.alignment = alignment
    sv.spacing   = CGFloat(spaceing) * appConstant.widthRatio
    sv.backgroundColor = .clear
    sv.translatesAutoresizingMaskIntoConstraints = false
    return sv
}

func createSlider() -> UISlider {
    let sl = UISlider()
    sl.translatesAutoresizingMaskIntoConstraints = false
    sl.tintColor = theme_color()
    sl.maximumTrackTintColor = .gray
    sl.minimumTrackTintColor = theme_color()
    sl.backgroundColor = .clear
    sl.minimumValue = 0.0
    sl.maximumValue = 1.0
    return sl
}

func createSwitch() -> UISwitch {
    let view = UISwitch()
    view.onTintColor = theme_color()
    view.tintColor = .black
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}

func createCV(_ direction: UICollectionView.ScrollDirection = .horizontal ) -> UICollectionView {
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.scrollDirection = direction
    let  collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = UIColor.clear
    collectionView.clipsToBounds = true
    collectionView.layer.zPosition = 3
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.isScrollEnabled = true
    collectionView.isUserInteractionEnabled = true
    return collectionView
}
