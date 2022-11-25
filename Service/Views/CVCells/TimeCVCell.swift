//
//  timeCVCell.swift
//  Service
//
//  Created by Hamza on 01/10/2022.
//

import UIKit

class TimeCVCell: UICollectionViewCell {
    
    let bgView = View(backgroundColor: tf_border())
    let timeLbl = Label(text: "07:00 AM", font:  Font.semiBold(14), color: .black)
    
    static var identifier: String = "TimeCVCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = false
        bgView.layer.cornerRadius = 15 * appConstant.heightRatio
        bgView.layer.shadowRadius = 1
        bgView.layer.shadowOpacity = 0.3
        bgView.layer.shadowColor = shadow_color().cgColor
        bgView.layer.shadowOffset = .init(width: 0, height: 0)
        bgView.layer.borderColor = UIColor.white.cgColor
        bgView.layer.borderWidth = 1 * appConstant.heightRatio
        setupCell()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func setupCell(){
        contentView.addSubview(bgView)
        bgView.addSubview(timeLbl)
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4 * appConstant.heightRatio),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4 * appConstant.widthRatio),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4 * appConstant.widthRatio),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4 * appConstant.widthRatio),
            
            timeLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0 * appConstant.heightRatio),
            timeLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            timeLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            timeLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0 * appConstant.widthRatio),
        ])
    }
}
