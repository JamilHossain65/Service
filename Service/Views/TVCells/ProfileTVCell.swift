//
//  profileTVCell.swift
//  Service
//
//  Created by Hamza on 02/10/2022.
//

import UIKit

class ProfileTVCell: UITableViewCell {
    
    lazy var backGroundView = View(cornerRadius: 20 * appConstant.heightRatio)
    lazy var logoImg = ImageView(imageName: "user_ic")
    lazy var lineView = View(backgroundColor: tf_border())
    lazy var titleLbl = Label(text: "Tilte", font: Font.regular(16), color: .black, alignment: .left)
    lazy var nextBtn = Button(imageName: "forward_ic")
    lazy var roleSwitch = ProfileTVCell.createSwitch()
    lazy var countLbl = Label(text: "1", font: Font.regular(12) )
    
    static var cellidentifier = "ProviderTVCell"
    
    override class func awakeFromNib() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        roleSwitch.isHidden = true
        nextBtn.isHidden = true
        backGroundView.clipsToBounds = false
        backGroundView.layer.borderWidth = 2 * appConstant.heightRatio
        backGroundView.layer.borderColor = tf_border().cgColor
        
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
    
    func setup() {
        contentView.addSubview(backGroundView)
        backGroundView.addSubview(logoImg)
        backGroundView.addSubview(lineView)
        backGroundView.addSubview(titleLbl)
        backGroundView.addSubview(nextBtn)
        backGroundView.addSubview(roleSwitch)
        backGroundView.addSubview(countLbl)
        
        NSLayoutConstraint.activate([
            backGroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4 * appConstant.widthRatio),
            backGroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4 * appConstant.widthRatio),
            backGroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4 *  appConstant.heightRatio),
            backGroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4 * appConstant.heightRatio),
            
            logoImg.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 14 * appConstant.widthRatio),
            logoImg.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor),
            logoImg.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            logoImg.widthAnchor.constraint(equalToConstant: 24 * appConstant.widthRatio),
            
            lineView.leadingAnchor.constraint(equalTo: logoImg.trailingAnchor, constant: 14 * appConstant.widthRatio),
            lineView.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 15 * appConstant.heightRatio),
            lineView.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -15 * appConstant.heightRatio),
            lineView.widthAnchor.constraint(equalToConstant: 1 * appConstant.widthRatio),
            
            titleLbl.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 10 * appConstant.widthRatio),
            titleLbl.trailingAnchor.constraint(equalTo: nextBtn.leadingAnchor, constant: -10 * appConstant.widthRatio),
            titleLbl.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 4 *  appConstant.heightRatio),
            titleLbl.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -4 * appConstant.heightRatio),
            
            nextBtn.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -14 * appConstant.widthRatio),
            nextBtn.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor),
            nextBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            nextBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            roleSwitch.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor),
            roleSwitch.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -14 * appConstant.widthRatio),
            roleSwitch.widthAnchor.constraint(equalToConstant: 44 * appConstant.widthRatio),
            roleSwitch.heightAnchor.constraint(equalToConstant: 35 * appConstant.heightRatio),
            
            countLbl.trailingAnchor.constraint(equalTo: roleSwitch.trailingAnchor),
            countLbl.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            countLbl.heightAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            countLbl.widthAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            
        ])
    }
    
    func setupCellData(_ item: ProfileList) {
        self.titleLbl.text = item.rawValue
        self.logoImg.image = item.image
       
        if item == .logout {
            self.countLbl.isHidden = true
            self.roleSwitch.isHidden = true
            self.nextBtn.isHidden = true
        } else if item == .pushNotification {
            self.countLbl.isHidden = true
            self.roleSwitch.isHidden = false
            self.nextBtn.isHidden = true
        } else if item == .chat {
            self.countLbl.isHidden = true
            self.roleSwitch.isHidden = true
            self.nextBtn.isHidden = true
        } else {
            self.countLbl.isHidden = true
            self.roleSwitch.isHidden = true
            self.nextBtn.isHidden = false
        }
    }

}
