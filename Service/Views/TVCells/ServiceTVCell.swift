//
//  ServiceTVCell.swift
//  Service
//
//  Created by Hamza on 08/10/2022.
//

import UIKit
import SnapKit

class ServiceTVCell: UITableViewCell {

    lazy var repareView = ServiceView.init()
    
    lazy var bgView = View(backgroundColor: .clear, cornerRadius: 20)
    
    
    static var cellidentifier = "ServiceTVCell"
    
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
    
    func setdata(){
        
    }
    
    private func setup() {
        contentView.addSubview(bgView)
        bgView.addSubview(repareView)
        
        bgView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(10.s)
            make.bottom.equalToSuperview().offset(-10.s)
            make.leading.equalToSuperview().offset(15.s)
            make.trailing.equalToSuperview().offset(-15.s)
        }
        
        repareView.snp.makeConstraints{ make in
            make.edges.equalTo(bgView)
        }
    }

}
