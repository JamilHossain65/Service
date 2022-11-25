//
//  CompnyShopView.swift
//  Service
//
//  Created by Hamza on 29/09/2022.
//

import Foundation
import UIKit

class CompnyShopView: UIView {
    
    lazy var compnyLbl = Label(text: "Service", font: Font.medium(16), color: .black)
    lazy var viewAllBtn = Button(text: "View all", textColor: redText_color())
    lazy var serviceCV : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let  collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.clipsToBounds = true
        collectionView.layer.zPosition = 3
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.isUserInteractionEnabled = true
        return collectionView
    }()
    lazy var nullLbl = Label(text: "No item Avalible".localized, font: Font.medium(), color: theme_gray(), alignment: .center, numberOfLines: 1)
    
    var delegate: CompnayShopViewDelegate?
    
    var compnyItems: [ProfessionalItemModel]? {
        didSet {
            serviceCV.reloadData()
        }
    }
    
    var compnyNameText: String = "Service" {
        didSet {
            self.compnyLbl.text = compnyNameText
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = false
        commonInit()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    func commonInit() {
        setupViews()
        initialize_setup()
        initialize_layout()
    }
    func initialize_setup() {
        nullLbl.isHidden = true
        serviceCV.delegate = self
        serviceCV.dataSource = self
        serviceCV.register(CompnyShopCVCell.self, forCellWithReuseIdentifier: CompnyShopCVCell.identifier)
        
    }
    func initialize_layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(compnyLbl)
        addSubview(viewAllBtn)
        addSubview(serviceCV)
        addSubview(nullLbl)
        
        NSLayoutConstraint.activate([
            compnyLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10 * appConstant.widthRatio),
            compnyLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 20 * appConstant.heightRatio),
            
            viewAllBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16 * appConstant.widthRatio),
            viewAllBtn.centerYAnchor.constraint(equalTo: compnyLbl.centerYAnchor),
            
            serviceCV.leadingAnchor.constraint(equalTo: compnyLbl.leadingAnchor),
            serviceCV.topAnchor.constraint(equalTo: compnyLbl.bottomAnchor, constant: 8 * appConstant.heightRatio),
            serviceCV.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            serviceCV.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            nullLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nullLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    private func setupViews() {
       
    }
}

extension CompnyShopView: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        compnyItems?.count == 0 ? (nullLbl.isHidden = false) : (nullLbl.isHidden = true)
        return compnyItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = serviceCV.dequeueReusableCell(withReuseIdentifier: CompnyShopCVCell.identifier, for: indexPath) as! CompnyShopCVCell
        cell.serviceLbl.text = compnyItems?[indexPath.row].title
        cell.priceLbl.text = (compnyItems?[indexPath.row].price ?? "0.0") + " KD"
        cell.serviceImg.kf.setImage(with: .network(URL(string: compnyItems?[indexPath.row].image ?? "abc")!), placeholder: UIImage(named: "image_dummy"))
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.companySrviceSelect(productId: compnyItems?[indexPath.row].id ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120 * appConstant.widthRatio, height: 190 * appConstant.heightRatio )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 * appConstant.widthRatio
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0 * appConstant.widthRatio, bottom: 0 * appConstant.heightRatio, right: 2 * appConstant.widthRatio)
    }
}



