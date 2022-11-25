//
//  AddressTVCell.swift
//  Service
//
//  Created by Hamza on 23/10/2022.
//

import UIKit

class AddressTVCell: UITableViewCell {
    
    lazy var bgView = View(backgroundColor: .white, cornerRadius: 20)
    lazy var nameLbl = Label(text: "Mohammed Ali", font: Font.semiBold(16), color: .black, alignment: .left)
    lazy var msgLbl = Label(text: "A unique electronic service provided by the public Authority of...", font: Font.regular(16), color: .black, alignment: .left, numberOfLines: 2)

    static var cellidentifier = "AddressTVCell"
    
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
    
    func setup() {
        contentView.addSubview(bgView)
        bgView.addSubview(nameLbl)
        bgView.addSubview(msgLbl)
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * appConstant.heightRatio),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * appConstant.widthRatio),
            
            nameLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 12 * appConstant.widthRatio),
            nameLbl.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10 * appConstant.heightRatio),
            nameLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -12 * appConstant.widthRatio),
            
            msgLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            msgLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            msgLbl.trailingAnchor.constraint(equalTo: nameLbl.trailingAnchor, constant: 0 * appConstant.widthRatio),
            
        ])
    }
    
    func setupCell(address: AddressModel) {
        nameLbl.text = address.address_title
        msgLbl.text = address.complete_address
        address.is_default == 1 ? setBoarder() : clearBoarder()
    }
    
    private func setBoarder() {
        bgView.layer.borderColor = UIColor.black.cgColor
        bgView.layer.borderWidth = 1
    }
    
    private func clearBoarder() {
        bgView.layer.borderColor = UIColor.black.cgColor
        bgView.layer.borderWidth = 0
    }
}
