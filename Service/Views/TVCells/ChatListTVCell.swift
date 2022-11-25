//
//  ChatListTVCell.swift
//  Service
//
//  Created by Hamza on 29/09/2022.
//

import UIKit

class ChatListTVCell: UITableViewCell {
    
    lazy var bgView = View(backgroundColor: .white, cornerRadius: 20)
    lazy var userImg = ImageView(imageName: "chat_dummy_ic", cornerRadius: 40)
    lazy var nameLbl = Label(text: "Mohammed Ali ", font: Font.semiBold(16), color: .black, alignment: .left)
    lazy var msgLbl = Label(text: "A unique electronic service provided by the public Authority of...", font: Font.medium(12), color: .black, alignment: .left, numberOfLines: 2)
    lazy var timeLbl = Label(text: "11:26 AM", font: Font.medium(12), color: theme_gray(), alignment: .right)
    lazy var countLbl = Label(text: "1", font: Font.regular(12) )
    
    static var cellidentifier = "ChatListTVCell"
    
    override class func awakeFromNib() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        
        countLbl.layer.cornerRadius = 14 * appConstant.heightRatio
        countLbl.clipsToBounds = true
        countLbl.backgroundColor = theme_color()
        
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
        bgView.addSubview(timeLbl)
        bgView.addSubview(countLbl)
        
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
            nameLbl.trailingAnchor.constraint(equalTo: timeLbl.leadingAnchor, constant: -2 * appConstant.widthRatio),
            
            msgLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            msgLbl.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -20 * appConstant.heightRatio),
            msgLbl.trailingAnchor.constraint(equalTo: timeLbl.leadingAnchor, constant: -2 * appConstant.widthRatio),
            
            timeLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -10 * appConstant.widthRatio),
            timeLbl.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 8 * appConstant.heightRatio),
            timeLbl.widthAnchor.constraint(equalToConstant: 80 * appConstant.widthRatio),
            
            countLbl.trailingAnchor.constraint(equalTo: timeLbl.trailingAnchor),
            countLbl.topAnchor.constraint(equalTo: timeLbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            countLbl.heightAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
            countLbl.widthAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
            
        ])
    }
    
    func setupData(chat: ChatListModel) {
//        userImg.kf.setImage(with: .network(URL(string: (chat.provider?.image ?? "abc")!)!))
        userImg.kf.setImage(with: URL(string: (chat.provider?.image ?? "abc")!)!, placeholder: UIImage(named: "chat_dummy_ic"))
        nameLbl.text = (chat.provider?.first_name ?? "") + " " +  (chat.provider?.last_name ?? "")
        msgLbl.text = chat.message.stringValue
        print( chat.created_at?.formatDate)
        timeLbl.text = chat.created_at?.formatDate
        countLbl.isHidden = true
    }
    
}
