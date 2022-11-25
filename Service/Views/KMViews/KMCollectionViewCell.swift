//
//  KMCollectionViewCell.swift
//  Service
//
//  Created by Hamza on 27/09/2022.
//

import Foundation

import UIKit
class KMBannerCollectionViewCell: UICollectionViewCell {
    
    lazy var imageViewBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 0
        view.layer.shadowRadius = 0
        view.layer.shadowOpacity = 0.7
        view.layer.shadowColor = UIColor.clear.cgColor
        view.layer.shadowOffset = .init(width: 0, height: 0)
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleAspectFit
        imageV.layer.cornerRadius = 0
        imageV.layer.masksToBounds = false
        imageV.backgroundColor = .clear
        return imageV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    func commonInit() {
        initialize_setup()
        initialize_layout()
    }
    func initialize_setup()     {
        contentView.addSubview(imageViewBackgroundView)
        contentView.addSubview(imageView)
    }
    func initialize_layout()    {
        let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: 470 * appConstant.heightRatio)
        imageViewBackgroundView.frame = rect
        imageView.frame = rect
    }
}
