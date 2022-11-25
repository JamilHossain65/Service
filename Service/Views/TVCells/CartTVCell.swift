//
//  CartTVCell.swift
//  Service
//
//  Created by Hamza on 10/11/2022.
//

import UIKit

class CartTVCell: UITableViewCell {

    lazy var bgView = View(backgroundColor: .white, cornerRadius: 20)
    lazy var itemImg = ImageView(imageName: "cartImg", cornerRadius: 0, contentMode: .scaleAspectFit)
    lazy var nameLbl = Label(text: "Bentley Intense For Men 100 ml Eau de Parfum", font: Font.semiBold(16), color: .black, alignment: .left, numberOfLines: 2)
    lazy var priceLbl = Label(text: "199.0 KD", font: Font.semiBold(20), color: .black, alignment: .right, numberOfLines: 1)
    lazy var itemCount = Label(text: "2 Item", font: Font.medium(14), color: .black, alignment: .right, numberOfLines: 1)
    lazy var countView = View()
    lazy var countLbl = Label(text: "1", font: Font.semiBold(20), color: .black)
    lazy var minusBtn = Button(imageName: "minuBtn_ic", cornerRadius: 18)
    lazy var plusBtn = Button(imageName: "plusBtn_ic", cornerRadius: 18)
    lazy var deleteBtn = Button(imageName: "delete_pink_ic", cornerRadius: 18)
    
    static var cellidentifier = "CartTVCell"
    var items: String = "0" {
        didSet {
            countLbl.text = items
            itemCount.text = items + " items"
        }
    }
    
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
        bgView.addSubview(itemCount)
        bgView.addSubview(priceLbl)
        bgView.addSubview(itemImg)
        bgView.addSubview(deleteBtn)
        bgView.addSubview(countView)
        countView.addSubview(minusBtn)
        countView.addSubview(countLbl)
        countView.addSubview(plusBtn)
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * appConstant.heightRatio),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * appConstant.widthRatio),
            
            itemImg.leadingAnchor.constraint(equalTo: bgView.leadingAnchor),
            itemImg.bottomAnchor.constraint(equalTo: bgView.bottomAnchor),
            itemImg.topAnchor.constraint(equalTo: bgView.topAnchor),
            itemImg.widthAnchor.constraint(equalToConstant: 140 * appConstant.widthRatio),
            
            nameLbl.leadingAnchor.constraint(equalTo: itemImg.trailingAnchor, constant: 8 * appConstant.heightRatio),
            nameLbl.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 8 * appConstant.heightRatio),
            nameLbl.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -8 * appConstant.widthRatio),
            
            itemCount.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor),
            itemCount.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            
            priceLbl.trailingAnchor.constraint(equalTo: nameLbl.trailingAnchor),
            priceLbl.centerYAnchor.constraint(equalTo: itemCount.centerYAnchor),
            
            countView.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0 * appConstant.heightRatio),
            countView.topAnchor.constraint(equalTo: itemCount.bottomAnchor, constant: 8 * appConstant.heightRatio),
            countView.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            countView.widthAnchor.constraint(equalToConstant: 120 * appConstant.widthRatio),
            
            countLbl.centerYAnchor.constraint(equalTo: countView.centerYAnchor),
            countLbl.centerXAnchor.constraint(equalTo: countView.centerXAnchor),
            
            minusBtn.leadingAnchor.constraint(equalTo: countView.leadingAnchor, constant: 1 * appConstant.widthRatio),
            minusBtn.centerYAnchor.constraint(equalTo: countView.centerYAnchor),
            minusBtn.heightAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
            minusBtn.widthAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
            
            plusBtn.trailingAnchor.constraint(equalTo: countView.trailingAnchor, constant: -1 * appConstant.widthRatio),
            plusBtn.centerYAnchor.constraint(equalTo: countView.centerYAnchor),
            plusBtn.heightAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
            plusBtn.widthAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
            
            deleteBtn.trailingAnchor.constraint(equalTo: nameLbl.trailingAnchor),
            deleteBtn.bottomAnchor.constraint(equalTo: plusBtn.bottomAnchor),
            deleteBtn.heightAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
            deleteBtn.widthAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
        ])
    }
    
    func setupCellData(cart: CartModel) {
        nameLbl.text = cart.items?.title.stringValue
        priceLbl.text = cart.price.stringValue + " KD"
        items = cart.quantity ?? "0"
        self.itemImg.kf.setImage(with: .network(URL(string: cart.items?.image ?? "abc")!), placeholder: UIImage(named: "image_dummy"))
        
    }
}
