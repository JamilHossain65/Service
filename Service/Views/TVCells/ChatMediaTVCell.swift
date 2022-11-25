//
//  ChatMediaTVCell.swift
//  Service
//
//  Created by Hamza on 08/10/2022.
//

import UIKit

class ChatMediaTVCell: UITableViewCell {
    
    lazy var mediaImg = ImageView(imageName: "media_dummy_ic", cornerRadius: 20)
    lazy var timeLbl = Label(text: "11:26 AM", font: Font.medium(12), color: theme_gray(), alignment: .right)
    lazy var userImg = ImageView(imageName: "chat_dummy_ic", cornerRadius: 20, contentMode: .scaleAspectFit)
    
    static var cellidentifier = "ChatMediaTVCell"
    
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
        contentView.addSubview(mediaImg)
        contentView.addSubview(timeLbl)
        contentView.addSubview(userImg)
        
        NSLayoutConstraint.activate([
            userImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            userImg.bottomAnchor.constraint(equalTo: mediaImg.bottomAnchor),
            userImg.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            userImg.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            mediaImg.trailingAnchor.constraint(equalTo: userImg.leadingAnchor, constant: -6 * appConstant.widthRatio),
            mediaImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12 * appConstant.heightRatio),
            mediaImg.heightAnchor.constraint(equalToConstant: 190 * appConstant.heightRatio),
            mediaImg.widthAnchor.constraint(equalToConstant: 220 * appConstant.widthRatio),
            
            timeLbl.topAnchor.constraint(equalTo: mediaImg.bottomAnchor, constant: 12 * appConstant.heightRatio),
            timeLbl.trailingAnchor.constraint(equalTo: mediaImg.trailingAnchor),
            timeLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12 * appConstant.heightRatio),
        ])
    }
}
