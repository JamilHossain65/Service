//
//  ChatTextTVCell.swift
//  Service
//
//  Created by Hamza on 08/10/2022.
//

import UIKit

class ChatLeftTextTVCell: UITableViewCell {
    
    lazy var bgImg = ImageView(imageName: "left_text_ic")
    lazy var userImg = ImageView(imageName: "chat_dummy_ic", cornerRadius: 20, contentMode: .scaleAspectFit)
    lazy var msgLbl = Label(text: "Hi there, where are you? When you come?", font: Font.medium(12), color: .black,alignment: .left, numberOfLines: 0)
    lazy var timeLbl = Label(text: "11:26 AM", font: Font.medium(12), color: theme_gray())
    
    static var cellidentifier = "ChatLeftTextTVCell"
    
    override class func awakeFromNib() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func  setup() {
        contentView.addSubview(userImg)
        contentView.addSubview(bgImg)
        contentView.addSubview(msgLbl)
        contentView.addSubview(timeLbl)
        
        NSLayoutConstraint.activate([
  
            userImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            userImg.bottomAnchor.constraint(equalTo: bgImg.bottomAnchor),
            userImg.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            userImg.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            msgLbl.leadingAnchor.constraint(equalTo: bgImg.leadingAnchor, constant: 24 * appConstant.widthRatio),
            msgLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24 * appConstant.heightRatio),
            msgLbl.bottomAnchor.constraint(equalTo: timeLbl.topAnchor, constant: -8 * appConstant.heightRatio),
            msgLbl.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -24 * appConstant.widthRatio),
            
            bgImg.leadingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 6 * appConstant.widthRatio),
            bgImg.topAnchor.constraint(equalTo: msgLbl.topAnchor, constant: -12 * appConstant.heightRatio),
            bgImg.bottomAnchor.constraint(equalTo: msgLbl.bottomAnchor, constant: 12 * appConstant.heightRatio),
            bgImg.trailingAnchor.constraint(equalTo: msgLbl.trailingAnchor, constant: 12 * appConstant.widthRatio),
            
            timeLbl.topAnchor.constraint(equalTo: bgImg.bottomAnchor, constant: 12 * appConstant.heightRatio),
            timeLbl.leadingAnchor.constraint(equalTo: bgImg.leadingAnchor, constant: 0),
            timeLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12 * appConstant.heightRatio),
            timeLbl.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio)
        ])
    }

}
