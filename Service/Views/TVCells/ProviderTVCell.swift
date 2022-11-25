//
//  ProviderTVCell.swift
//  Service
//
//  Created by Hamza on 01/10/2022.
//

import UIKit

class ProviderTVCell: UITableViewCell {
    
    lazy var bgView = View(backgroundColor: .white, cornerRadius: 20)
    lazy var userImg = ImageView(imageName: "provider_dummy_ic", cornerRadius: 40)
    lazy var nameLbl = Label(text: "Power Electronics ", font: Font.semiBold(16), color: .black, alignment: .left)
    lazy var msgLbl = Label(text: "A unique electronic service\nprovided by the public Authority of...", font: Font.medium(12), color: .black, alignment: .left, numberOfLines: 2)
    lazy var tickImg = ImageView(imageName: "tick_ic", cornerRadius: 0)
    
    static var cellidentifier = "ProviderTVCell"
    
    override class func awakeFromNib() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        bgView.layer.borderColor = UIColor.white.cgColor
        bgView.layer.borderWidth = 1
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(bgView)
        bgView.addSubview(userImg)
        bgView.addSubview(nameLbl)
        bgView.addSubview(msgLbl)
        bgView.addSubview(tickImg)
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * appConstant.heightRatio),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * appConstant.widthRatio),
            
            userImg.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 10 * appConstant.widthRatio),
            userImg.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            userImg.heightAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            userImg.widthAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            
            nameLbl.leadingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 9 * appConstant.widthRatio),
            nameLbl.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 16 * appConstant.heightRatio),
            nameLbl.trailingAnchor.constraint(equalTo: tickImg.leadingAnchor, constant: -2 * appConstant.widthRatio),
            
            msgLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            msgLbl.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -10 * appConstant.heightRatio),
            msgLbl.trailingAnchor.constraint(equalTo: tickImg.leadingAnchor, constant: -2 * appConstant.widthRatio),
    
            tickImg.trailingAnchor.constraint(equalTo: bgView.trailingAnchor),
            tickImg.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 5 * appConstant.heightRatio),
            tickImg.heightAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
            tickImg.widthAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
            
        ])
    }
    
}
