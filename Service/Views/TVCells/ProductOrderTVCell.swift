//
//  ProductOrderTVCell.swift
//  Service
//
//  Created by Hamza on 23/10/2022.
//

import UIKit

class ProductOrderTVCell: UITableViewCell {
    
    lazy var bgView = View(backgroundColor: .white, cornerRadius: 20)
    lazy var nameLbl = Label(text: "Mohammed Ali", font: Font.semiBold(16), color: .black, alignment: .left)
    lazy var msgLbl = Label(text: "A unique electronic service provided by the public Authority of...", font: Font.regular(16), color: .black, alignment: .left, numberOfLines: 2)
    lazy var orderLbl = Label(text: "Order # 12344", font: Font.regular(16), color: .black, alignment: .left)
    lazy var rateBtn = createcustomeBtn(text: "View and Rate")
    

    static var cellidentifier = "ProductOrderTVCell"
    
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
        bgView.addSubview(orderLbl)
        bgView.addSubview(rateBtn)
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * appConstant.heightRatio),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * appConstant.widthRatio),
            
            nameLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 12 * appConstant.widthRatio),
            nameLbl.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 16 * appConstant.heightRatio),
            nameLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -12 * appConstant.widthRatio),
            
            orderLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            orderLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 8 * appConstant.heightRatio),
            
            msgLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            msgLbl.topAnchor.constraint(equalTo: orderLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            msgLbl.trailingAnchor.constraint(equalTo: nameLbl.trailingAnchor, constant: 0 * appConstant.widthRatio),
            
            rateBtn.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            rateBtn.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -16 * appConstant.heightRatio),
            rateBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            rateBtn.widthAnchor.constraint(equalToConstant: 150 * appConstant.heightRatio),
        ])
    }

}
