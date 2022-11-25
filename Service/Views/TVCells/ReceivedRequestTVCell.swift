//
//  ReceivedRequestTVCell.swift
//  Service
//
//  Created by Hamza on 03/10/2022.
//

import UIKit

class ReceivedRequestTVCell: UITableViewCell {
    
    lazy var bgView = View(backgroundColor: .white, cornerRadius: 20)
    lazy var requestView = View(backgroundColor: tf_border(), cornerRadius: 20)
    lazy var requestIdLbl = Label(text: "Request ID \n7654321", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 2)
    lazy var acceptBtn = Button(text: "Accept", backgroundColor: theme_color(), textColor: .black, cornerRadius: 20)
    lazy var rejectBtn = Button(text: "Reject", backgroundColor: unselected_color(), textColor: .black, cornerRadius: 20)
    lazy var userImg = ImageView(imageName: "chat_dummy_ic", cornerRadius: 40)
    lazy var nameLbl = Label(text: "Mohammed Ali ", font: Font.semiBold(16), color: .black, alignment: .left)
    lazy var msgLbl = Label(text: "A unique electronic service provided by the public Authority of...", font: Font.medium(12), color: .black, alignment: .left, numberOfLines: 2)
    lazy var providerlbl = Label(text: "Provider", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 1)
    lazy var providerShowLbl = Label(text: "Power Electronics ", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var datelbl = Label(text: "Selected Date & Time", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 1)
    lazy var dateShowLbl = Label(text: "May 2022, 08:00 AM", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var amountlbl = Label(text: "Amount", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 1)
    lazy var amountShowLbl = Label(text: "KD 50.000", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var msgBtn = Button(imageName: "", cornerRadius: 15)
    lazy var msgImg = ImageView(imageName: "chart.bar.doc.horizontal")

    static var cellidentifier = "ReceivedRequestTVCell"
    
    override class func awakeFromNib() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        msgImg.image = UIImage(systemName: "chart.bar.doc.horizontal")
        msgImg.tintColor = .black
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
        bgView.addSubview(requestView)
        requestView.addSubview(requestIdLbl)
        requestView.addSubview(acceptBtn)
        requestView.addSubview(rejectBtn)
        bgView.addSubview(userImg)
        bgView.addSubview(nameLbl)
        bgView.addSubview(msgLbl)
        bgView.addSubview(providerlbl)
        bgView.addSubview(providerShowLbl)
        bgView.addSubview(datelbl)
        bgView.addSubview(dateShowLbl)
        bgView.addSubview(amountlbl)
        bgView.addSubview(amountShowLbl)
        bgView.addSubview(msgBtn)
        bgView.addSubview(msgImg)
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * appConstant.heightRatio),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * appConstant.widthRatio),
            
            requestView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 0 * appConstant.heightRatio),
            requestView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            requestView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            requestView.heightAnchor.constraint(equalToConstant: 60 * appConstant.heightRatio),
            
            requestIdLbl.leadingAnchor.constraint(equalTo: requestView.leadingAnchor, constant: 23 * appConstant.widthRatio),
            requestIdLbl.centerYAnchor.constraint(equalTo: requestView.centerYAnchor),
            
            rejectBtn.centerYAnchor.constraint(equalTo: requestView.centerYAnchor),
            rejectBtn.trailingAnchor.constraint(equalTo: requestView.trailingAnchor, constant: -5 * appConstant.widthRatio),
            rejectBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            rejectBtn.widthAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            
            acceptBtn.centerYAnchor.constraint(equalTo: requestView.centerYAnchor),
            acceptBtn.trailingAnchor.constraint(equalTo: rejectBtn.leadingAnchor, constant: -10 * appConstant.widthRatio),
            acceptBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            acceptBtn.widthAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            
            userImg.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 35 * appConstant.widthRatio),
            userImg.topAnchor.constraint(equalTo: requestView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            userImg.heightAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            userImg.widthAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            
            nameLbl.leadingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 9 * appConstant.widthRatio),
            nameLbl.topAnchor.constraint(equalTo: requestView.bottomAnchor, constant: 30 * appConstant.heightRatio),
            nameLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -30 * appConstant.widthRatio),
            
            msgLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            msgLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 6 * appConstant.heightRatio),
            msgLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -30 * appConstant.widthRatio),
            
            providerlbl.leadingAnchor.constraint(equalTo: userImg.leadingAnchor),
            providerlbl.topAnchor.constraint(equalTo: userImg.bottomAnchor, constant: 18 * appConstant.heightRatio),
            
            providerShowLbl.leadingAnchor.constraint(equalTo: userImg.leadingAnchor),
            providerShowLbl.topAnchor.constraint(equalTo: providerlbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            
            datelbl.leadingAnchor.constraint(equalTo: userImg.leadingAnchor),
            datelbl.topAnchor.constraint(equalTo: providerShowLbl.bottomAnchor, constant: 18 * appConstant.heightRatio),
            
            dateShowLbl.leadingAnchor.constraint(equalTo: userImg.leadingAnchor),
            dateShowLbl.topAnchor.constraint(equalTo: datelbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            
            amountlbl.leadingAnchor.constraint(equalTo: userImg.leadingAnchor),
            amountlbl.topAnchor.constraint(equalTo: dateShowLbl.bottomAnchor, constant: 18 * appConstant.heightRatio),
            
            amountShowLbl.leadingAnchor.constraint(equalTo: userImg.leadingAnchor),
            amountShowLbl.topAnchor.constraint(equalTo: amountlbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            
            msgBtn.topAnchor.constraint(equalTo: msgImg.topAnchor, constant: 0 * appConstant.heightRatio),
            msgBtn.leadingAnchor.constraint(equalTo: msgImg.leadingAnchor, constant: 0 * appConstant.widthRatio),
            msgBtn.trailingAnchor.constraint(equalTo: msgImg.trailingAnchor, constant: 0 * appConstant.widthRatio),
            msgBtn.bottomAnchor.constraint(equalTo: msgImg.bottomAnchor, constant: 0 * appConstant.widthRatio),
            
            msgImg.centerYAnchor.constraint(equalTo: amountlbl.centerYAnchor),
            msgImg.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -23 * appConstant.widthRatio),
            msgImg.heightAnchor.constraint(equalToConstant: 27 * appConstant.heightRatio),
            msgImg.widthAnchor.constraint(equalToConstant: 25 * appConstant.widthRatio),
        ])
    }
    
    func setupData(qutation: QutationsModel) {
        requestIdLbl.text = "Request ID \n\(qutation.id ?? 0)"
        userImg.kf.setImage(with: .network(URL(string: qutation.image ?? "wert")!), placeholder: UIImage(named: "chat_dummy_ic"))
        nameLbl.text = qutation.first_name.stringValue + " " + qutation.last_name.stringValue
        providerShowLbl.text = qutation.provider_business_name.stringValue
        dateShowLbl.text = qutation.request_service_date.stringValue + " " + qutation.request_service_time.stringValue
        amountShowLbl.text = "KD " + qutation.quote_amount.stringValue
    }
}
