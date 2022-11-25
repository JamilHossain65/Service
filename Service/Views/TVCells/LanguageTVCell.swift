//
//  LanguageTVCell.swift
//  Service
//
//  Created by Hamza on 23/10/2022.
//

import UIKit

class LanguageTVCell: UITableViewCell {
    
    lazy var languageLbl = Label(text: "English", font: Font.regular(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var selcetBtn = Button(imageName: "unSelectedCard_ic", cornerRadius: 12)
    
    static var cellidentifier = "LanguageTVCell"
    
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
        contentView.addSubview(languageLbl)
        contentView.addSubview(selcetBtn)
        
        NSLayoutConstraint.activate([
            languageLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24 * appConstant.widthRatio),
            languageLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            
            selcetBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24 * appConstant.widthRatio),
            selcetBtn.topAnchor.constraint(equalTo: languageLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            selcetBtn.widthAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            selcetBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
        ])
    }

}
