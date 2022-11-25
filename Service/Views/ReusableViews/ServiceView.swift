//
//  ServiceView.swift
//  Service
//
//  Created by Hamza on 28/09/2022.
//

import Foundation
import UIKit
import KMPageControl

class ServiceView: UIView {
    
    lazy var serviceLbl = Label(text: "Service", font: Font.medium(16), color: .black)
    lazy var viewAllBtn = Button(text: "View all", textColor: redText_color())
    lazy var serviceCV : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
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
    
    lazy var pageControl: KMPageControl = {
        let control = KMPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.activeSize = CGSize(width: 30, height: 10)
        control.inactiveSize = CGSize(width: 10, height: 10)
        control.activeColor = theme_color()
        control.inactiveColor = theme_gray()
        return control
    }()
    
    var delegate: ServiceViewDelegate?
    var category: MainCategoryModel? {
        didSet {
            if category?.sub_categories?.count ?? 0 <= 4 {
                pageControl.numberOfPages = 1
            } else {
                pageControl.numberOfPages = 2
            }
            serviceCV.reloadData()
        }
    }
    
    
    var serviceText: String = "Service" {
        didSet {
            self.serviceLbl.text = serviceText
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
        serviceCV.delegate = self
        serviceCV.dataSource = self
        serviceCV.register(ServiceCVCell.self, forCellWithReuseIdentifier: ServiceCVCell.identifier)

        pageControl.currentPage = 0
        
        viewAllBtn.addTarget(self, action: #selector(viewAllBtnTapped), for: .touchUpInside)
        
    }
    func initialize_layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(serviceLbl)
        addSubview(viewAllBtn)
        addSubview(serviceCV)
        addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            serviceLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15 * appConstant.widthRatio),
            serviceLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 20 * appConstant.heightRatio),
            
            viewAllBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16 * appConstant.widthRatio),
            viewAllBtn.centerYAnchor.constraint(equalTo: serviceLbl.centerYAnchor),
            
            serviceCV.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            serviceCV.topAnchor.constraint(equalTo: serviceLbl.bottomAnchor, constant: 14 * appConstant.heightRatio),
            serviceCV.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            serviceCV.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -14 * appConstant.heightRatio),
            
            pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14 * appConstant.heightRatio),
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            pageControl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    private func setupViews() {
       
    }
    
    @objc func viewAllBtnTapped() {
        self.delegate?.viewAllBtnTapped(subcategories: category?.sub_categories ?? [], heading: serviceLbl.text ?? "")
    }
}

extension ServiceView: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if category?.sub_categories?.count ?? 0 < 9 {
            return category?.sub_categories?.count ?? 0
        } else {
            return 8
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = serviceCV.dequeueReusableCell(withReuseIdentifier: ServiceCVCell.identifier, for: indexPath) as! ServiceCVCell
        cell.setupData((category?.sub_categories?[indexPath.row])!)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.serviceSelect(id: (category?.sub_categories?[indexPath.row].id)!, title: (category?.sub_categories?[indexPath.row].subcategory_name)!)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 78 * appConstant.widthRatio, height: 93 * appConstant.heightRatio )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 * appConstant.widthRatio
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0 * appConstant.widthRatio, bottom: 0 * appConstant.heightRatio, right: 2 * appConstant.widthRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item >= 3 {
            pageControl.currentPage = 0
        } else {
            pageControl.currentPage = 1
        }
    }
   
}



