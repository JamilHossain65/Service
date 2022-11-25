//
//  ChatRightTVCell.swift
//  Service
//
//  Created by Hamza on 08/10/2022.
//

import UIKit

class ChatRightTVCell: UITableViewCell {

    lazy var bgImg = ImageView(imageName: "right_chat_ic")
    lazy var userImg = ImageView(imageName: "chat_dummy_ic", cornerRadius: 20, contentMode: .scaleAspectFit)
    lazy var msgLbl = Label(text: "Hi Ashley! Yes with pleasure! Do you prefer when?", font: Font.medium(12), color: .black,alignment: .right, numberOfLines: 0)
    lazy var timeLbl = Label(text: "11:26 AM", font: Font.medium(12), color: theme_gray(), alignment: .right)
    
    static var cellidentifier = "ChatRightTVCell"
    
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
  
            userImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            userImg.bottomAnchor.constraint(equalTo: bgImg.bottomAnchor),
            userImg.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            userImg.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            msgLbl.trailingAnchor.constraint(equalTo: bgImg.trailingAnchor, constant: -24 * appConstant.widthRatio),
            msgLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24 * appConstant.heightRatio),
            msgLbl.bottomAnchor.constraint(equalTo: timeLbl.topAnchor, constant: -8 * appConstant.heightRatio),
            msgLbl.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 24 * appConstant.widthRatio),
            
            bgImg.trailingAnchor.constraint(equalTo: userImg.leadingAnchor, constant: -6 * appConstant.widthRatio),
            bgImg.topAnchor.constraint(equalTo: msgLbl.topAnchor, constant: -12 * appConstant.heightRatio),
            bgImg.bottomAnchor.constraint(equalTo: msgLbl.bottomAnchor, constant: 12 * appConstant.heightRatio),
            bgImg.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor, constant: -12 * appConstant.widthRatio),
            
            timeLbl.topAnchor.constraint(equalTo: bgImg.bottomAnchor, constant: 12 * appConstant.heightRatio),
            timeLbl.trailingAnchor.constraint(equalTo: bgImg.trailingAnchor, constant: 0),
            timeLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12 * appConstant.heightRatio),
            timeLbl.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio)
        ])                                                                                                                              
    }

}
