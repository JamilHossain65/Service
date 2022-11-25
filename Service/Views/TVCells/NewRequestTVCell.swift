//
//  NewRequestTVCell.swift
//  Service
//
//  Created by Hamza on 08/10/2022.
//

import UIKit

class NewRequestTVCell: UITableViewCell {
    
    lazy var bgView = View(backgroundColor: .white, cornerRadius: 20)
    lazy var nameLbl = Label(text: "Mohammed Ali ", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var msgLbl = Label(text: "Home Decoration", font: Font.medium(12), color: .black, alignment: .left, numberOfLines: 1)
    lazy var timeLbl = Label(text: "11:26 AM", font: Font.medium(12), color: theme_gray(), alignment: .right)
    lazy var userImg = ImageView(imageName: "chat_dummy_ic", cornerRadius: 40)
    lazy var datelbl = Label(text: "Selected Date & Time", font: Font.bold(12), color: .black, alignment: .left, numberOfLines: 1)
    lazy var dateShowLbl = Label(text: "May 2022, 08:00 AM", font: Font.medium(12), color: .black, alignment: .left, numberOfLines: 1)
    lazy var sendBtn = createcustomeBtn(text: "Send Quotation", font: Font.medium(12), cornerRadius: 15)

    static var cellidentifier = "NewRequestTVCell"
    
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
        contentView.addSubview(bgView)
        bgView.addSubview(nameLbl)
        bgView.addSubview(msgLbl)
        bgView.addSubview(timeLbl)
        bgView.addSubview(userImg)
        bgView.addSubview(datelbl)
        bgView.addSubview(dateShowLbl)
        bgView.addSubview(sendBtn)
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * appConstant.heightRatio),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * appConstant.widthRatio),
            
            userImg.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 6 * appConstant.widthRatio),
            userImg.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            userImg.heightAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            userImg.widthAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            
            nameLbl.leadingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 6 * appConstant.widthRatio),
            nameLbl.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 16 * appConstant.heightRatio),
            nameLbl.trailingAnchor.constraint(equalTo: timeLbl.leadingAnchor, constant: -2 * appConstant.widthRatio),
            
            msgLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            msgLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 1 * appConstant.heightRatio),
            msgLbl.trailingAnchor.constraint(equalTo: timeLbl.leadingAnchor, constant: -2 * appConstant.widthRatio),
            
            timeLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -10 * appConstant.widthRatio),
            timeLbl.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 8 * appConstant.heightRatio),
            
            datelbl.topAnchor.constraint(equalTo: msgLbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            datelbl.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor),
            
            dateShowLbl.leadingAnchor.constraint(equalTo: datelbl.leadingAnchor),
            dateShowLbl.topAnchor.constraint(equalTo: datelbl.bottomAnchor, constant: 1 * appConstant.heightRatio),
            
            sendBtn.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -4 * appConstant.widthRatio),
            sendBtn.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -15 * appConstant.heightRatio),
            sendBtn.widthAnchor.constraint(equalToConstant: 110 * appConstant.widthRatio),
            sendBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
        ])
    }
}
