//
//  RattingTVCell.swift
//  Service
//
//  Created by Hamza on 08/10/2022.
//

import UIKit

class RattingTVCell: UITableViewCell {
    
    lazy var timeLbl = Label(text: "3 months ago", font: Font.medium(12), color: theme_gray(), alignment: .right)
    lazy var userImg = ImageView(imageName: "chat_dummy_ic", cornerRadius: 20, contentMode: .scaleAspectFit)
    lazy var nameLbl = Label(text: "Sara", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var reviewLbl = Label(text: "Previous Eufy robots have tended to fit in the good value but slightly basic category. With the Eufy RoboVac X8 Hybrid, the company is back with a much smarter robot that offers proper mapping and a range of control features, so that the robot cleans when and how you want.", font: Font.regular(12), color: .black, alignment: .left, numberOfLines: 0)
    
    static var cellidentifier = "RattingTVCell"
    
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
        contentView.addSubview(timeLbl)
        contentView.addSubview(nameLbl)
        contentView.addSubview(reviewLbl)
        
        NSLayoutConstraint.activate([
            userImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            userImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * appConstant.heightRatio),
            userImg.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            userImg.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            timeLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            timeLbl.centerYAnchor.constraint(equalTo: nameLbl.centerYAnchor),
            
            nameLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16 * appConstant.heightRatio),
            nameLbl.leadingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 9 * appConstant.widthRatio),
            nameLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2 * appConstant.widthRatio),
            
            reviewLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            reviewLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor),
            reviewLbl.trailingAnchor.constraint(equalTo: timeLbl.trailingAnchor),
            reviewLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * appConstant.heightRatio),
        ])
    }
}
