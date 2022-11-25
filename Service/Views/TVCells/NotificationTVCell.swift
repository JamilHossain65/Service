//
//  NotificationTVCell.swift
//  Service
//
//  Created by Hamza on 23/10/2022.
//

import UIKit

class NotificationTVCell: UITableViewCell {

    lazy var notificatoiobImg = ImageView(imageName: "chat_dummy_ic", cornerRadius: 20)
    lazy var nameLbl = Label(text: "User", font: Font.semiBold(16), color: .black)
    lazy var msgLbl = Label(text: "You have received 2 new message", font: Font.medium(12), color: .black,alignment: .left, numberOfLines: 2)
    
    static var cellidentifier = "NotificationTVCell"
    
    override class func awakeFromNib() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        notificatoiobImg.tintColor = theme_color()
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        contentView.addSubview(notificatoiobImg)
        contentView.addSubview(nameLbl)
        contentView.addSubview(msgLbl)
        
        NSLayoutConstraint.activate([
            notificatoiobImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16 * appConstant.widthRatio),
            notificatoiobImg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            notificatoiobImg.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            notificatoiobImg.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            nameLbl.topAnchor.constraint(equalTo: notificatoiobImg.topAnchor, constant: 0),
            nameLbl.leadingAnchor.constraint(equalTo: notificatoiobImg.trailingAnchor, constant: 10 * appConstant.widthRatio),
            
            msgLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            msgLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16 * appConstant.widthRatio),
            msgLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
        ])
    }

}
