//
//  RequestTVCell.swift
//  Service
//
//  Created by Hamza on 29/09/2022.
//

import UIKit

class RequestTVCell: UITableViewCell {
    
    lazy var bgView = View(backgroundColor: .white, cornerRadius: 20)
    lazy var requestView = View(backgroundColor: tf_border(), cornerRadius: 20)
    lazy var requestIdLbl = Label(text: "Request ID \n7654321", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 2)
    lazy var forwardBtn = Button(imageName: "forward_ic", cornerRadius: 15)
    lazy var msgLbl = Label(text: "Awaiting quotation", font: Font.semiBold(16), color: theme_color(), alignment: .left, numberOfLines: 1)
    lazy var msgBtn = Button(imageName: "", cornerRadius: 15)
    lazy var msgImg = ImageView(imageName: "chart.bar.doc.horizontal")
    lazy var datelbl = Label(text: "Selected Date & Time", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 1)
    lazy var dateShowLbl = Label(text: "May 2022, 08:00 AM", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var amountlbl = Label(text: "Amount", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 1)
    lazy var amountShowLbl = Label(text: "KD 50.000", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var medialbl = Label(text: "Uploaded Media", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 1)
    lazy var mediaCV = createCV()
    
    static var cellidentifier = "RequestTVCell"
    var mediaList = [String]()
    
    override class func awakeFromNib() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        mediaCV.delegate = self
        mediaCV.dataSource = self
        mediaCV.register(MediaCVCell.self, forCellWithReuseIdentifier: MediaCVCell.identifier)
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
        requestView.addSubview(forwardBtn)
        bgView.addSubview(msgLbl)
        bgView.addSubview(msgBtn)
        bgView.addSubview(msgImg)
        bgView.addSubview(datelbl)
        bgView.addSubview(dateShowLbl)
        bgView.addSubview(amountlbl)
        bgView.addSubview(amountShowLbl)
        bgView.addSubview(medialbl)
        bgView.addSubview(mediaCV)
        
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
            
            forwardBtn.centerYAnchor.constraint(equalTo: requestView.centerYAnchor),
            forwardBtn.trailingAnchor.constraint(equalTo: requestView.trailingAnchor, constant: -23 * appConstant.widthRatio),
            forwardBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            forwardBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            msgLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 23 * appConstant.widthRatio),
            msgLbl.topAnchor.constraint(equalTo: requestView.bottomAnchor, constant: 18 * appConstant.heightRatio),
            
            msgBtn.topAnchor.constraint(equalTo: msgImg.topAnchor, constant: 0 * appConstant.heightRatio),
            msgBtn.leadingAnchor.constraint(equalTo: msgImg.leadingAnchor, constant: 0 * appConstant.widthRatio),
            msgBtn.trailingAnchor.constraint(equalTo: msgImg.trailingAnchor, constant: 0 * appConstant.widthRatio),
            msgBtn.bottomAnchor.constraint(equalTo: msgImg.bottomAnchor, constant: 0 * appConstant.widthRatio),
            
            msgImg.centerYAnchor.constraint(equalTo: msgLbl.centerYAnchor),
            msgImg.trailingAnchor.constraint(equalTo: requestView.trailingAnchor, constant: -23 * appConstant.widthRatio),
            msgImg.heightAnchor.constraint(equalToConstant: 27 * appConstant.heightRatio),
            msgImg.widthAnchor.constraint(equalToConstant: 25 * appConstant.widthRatio),
            
            datelbl.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor),
            datelbl.topAnchor.constraint(equalTo: msgLbl.bottomAnchor, constant: 18 * appConstant.heightRatio),
            
            dateShowLbl.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor),
            dateShowLbl.topAnchor.constraint(equalTo: datelbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            
            amountlbl.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor),
            amountlbl.topAnchor.constraint(equalTo: dateShowLbl.bottomAnchor, constant: 18 * appConstant.heightRatio),
            
            amountShowLbl.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor),
            amountShowLbl.topAnchor.constraint(equalTo: amountlbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            
            medialbl.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor),
            medialbl.topAnchor.constraint(equalTo: amountShowLbl.bottomAnchor, constant: 18 * appConstant.heightRatio),
            
            mediaCV.topAnchor.constraint(equalTo: medialbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            mediaCV.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            mediaCV.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -23 * appConstant.widthRatio),
            mediaCV.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
        ])
    }
    
    func setupCellData(request: pendingsRequestsModel) {
        requestIdLbl.text = "Request ID \n\(request.id)"
        dateShowLbl.text = request.request_service_date.stringValue + " " + request.request_service_time.stringValue
        amountShowLbl.text = "KD 0.00"
        mediaList = [request.request_media.stringValue]
    }
}

extension RequestTVCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mediaList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mediaCV.dequeueReusableCell(withReuseIdentifier: MediaCVCell.identifier, for: indexPath) as! MediaCVCell
        cell.serviceImg.kf.setImage(with: .network(URL(string: self.mediaList[indexPath.row])!))
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100 * appConstant.widthRatio, height: 100 * appConstant.heightRatio )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 * appConstant.widthRatio
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0 * appConstant.widthRatio, bottom: 0 * appConstant.heightRatio, right: 2 * appConstant.widthRatio)
    }
}


class CompletedTVCell: UITableViewCell {
    
    lazy var bgView = View(backgroundColor: .white, cornerRadius: 20)
    lazy var requestView = View(backgroundColor: tf_border(), cornerRadius: 20)
    lazy var requestIdLbl = Label(text: "Request ID \n7654321", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 2)
    lazy var forwardBtn = Button(imageName: "forward_ic", cornerRadius: 15)
    lazy var msgLbl = Label(text: "Task Completed", font: Font.semiBold(16), color: theme_color(), alignment: .left, numberOfLines: 1)
    lazy var msgImg = ImageView(imageName: "request_msg_dummy_ic")
    lazy var datelbl = Label(text: "Selected Date & Time", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 1)
    lazy var dateShowLbl = Label(text: "May 2022, 08:00 AM", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var amountlbl = Label(text: "Amount", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 1)
    lazy var amountShowLbl = Label(text: "KD 50.000", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var medialbl = Label(text: "Uploaded Media", font: Font.medium(14), color: .black, alignment: .left, numberOfLines: 1)
    lazy var mediaCV = createCV()
    
    static var cellidentifier = "CompletedTVCell"
    var mediaList = [String]()
    
    override class func awakeFromNib() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        mediaCV.delegate = self
        mediaCV.dataSource = self
        mediaCV.register(MediaCVCell.self, forCellWithReuseIdentifier: MediaCVCell.identifier)
        msgImg.isHidden = true
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
        requestView.addSubview(forwardBtn)
        bgView.addSubview(msgLbl)
        bgView.addSubview(msgImg)
        bgView.addSubview(datelbl)
        bgView.addSubview(dateShowLbl)
        bgView.addSubview(amountlbl)
        bgView.addSubview(amountShowLbl)
        bgView.addSubview(medialbl)
        bgView.addSubview(mediaCV)
        
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
            
            forwardBtn.centerYAnchor.constraint(equalTo: requestView.centerYAnchor),
            forwardBtn.trailingAnchor.constraint(equalTo: requestView.trailingAnchor, constant: -23 * appConstant.widthRatio),
            forwardBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            forwardBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            msgLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 23 * appConstant.widthRatio),
            msgLbl.topAnchor.constraint(equalTo: requestView.bottomAnchor, constant: 18 * appConstant.heightRatio),
            
            msgImg.centerYAnchor.constraint(equalTo: msgLbl.centerYAnchor),
            msgImg.trailingAnchor.constraint(equalTo: requestView.trailingAnchor, constant: -23 * appConstant.widthRatio),
            msgImg.heightAnchor.constraint(equalToConstant: 27 * appConstant.heightRatio),
            msgImg.widthAnchor.constraint(equalToConstant: 25 * appConstant.widthRatio),
            
            datelbl.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor),
            datelbl.topAnchor.constraint(equalTo: msgLbl.bottomAnchor, constant: 18 * appConstant.heightRatio),
            
            dateShowLbl.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor),
            dateShowLbl.topAnchor.constraint(equalTo: datelbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            
            amountlbl.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor),
            amountlbl.topAnchor.constraint(equalTo: dateShowLbl.bottomAnchor, constant: 18 * appConstant.heightRatio),
            
            amountShowLbl.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor),
            amountShowLbl.topAnchor.constraint(equalTo: amountlbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            
            medialbl.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor),
            medialbl.topAnchor.constraint(equalTo: amountShowLbl.bottomAnchor, constant: 18 * appConstant.heightRatio),
            
            mediaCV.topAnchor.constraint(equalTo: medialbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            mediaCV.leadingAnchor.constraint(equalTo: msgLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            mediaCV.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -23 * appConstant.widthRatio),
            mediaCV.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
        ])
    }
    
    func setupCellData(request: pendingsRequestsModel) {
        requestIdLbl.text = "Request ID \n\(request.id)"
        dateShowLbl.text = request.request_service_date.stringValue + " " + request.request_service_time.stringValue
        amountShowLbl.text = "KD 0.00"
        mediaList = [request.request_media.stringValue]
    }
}

extension CompletedTVCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mediaList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mediaCV.dequeueReusableCell(withReuseIdentifier: MediaCVCell.identifier, for: indexPath) as! MediaCVCell
        cell.serviceImg.kf.setImage(with: .network(URL(string: self.mediaList[indexPath.row])!))
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100 * appConstant.widthRatio, height: 100 * appConstant.heightRatio )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 * appConstant.widthRatio
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0 * appConstant.widthRatio, bottom: 0 * appConstant.heightRatio, right: 2 * appConstant.widthRatio)
    }
}



