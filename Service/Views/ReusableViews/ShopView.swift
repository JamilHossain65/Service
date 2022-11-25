//
//  ShopView.swift
//  Service
//
//  Created by Hamza on 11/11/2022.
//

import Foundation
import UIKit

class ShopView: UIView {
    
    var collectionView  : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
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
    lazy var nullLbl = Label(text: "No Data Found".localized, font: Font.medium(), color: theme_gray(), alignment: .center, numberOfLines: 1)
    
    var shopVM = ShopVM()
    var navController: UINavigationController!
    var delegate: ShopViewDelegate?
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = false
        commonInit()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    func commonInit() {
        initialize_setup()
        initialize_layout()
    }
    
    func initialize_setup() {
        nullLbl.isHidden = true
        collectionView.backgroundColor = .red
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        initCollectionView()
    }
    
    private func initCollectionView() {
//        collectionView.registerCells(cells: [ServiceViewCVCell, CompanyCVCell])
        self.collectionView.register(CompanyCVCell.self, forCellWithReuseIdentifier: CompanyCVCell.identifier)
        self.collectionView.register(ServiceViewCVCell.self, forCellWithReuseIdentifier: ServiceViewCVCell.identifier)
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
    }
    
    func initialize_layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        addSubview(nullLbl)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8 * appConstant.heightRatio),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8 * appConstant.heightRatio),
            
            nullLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nullLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
}

extension ShopView {
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnv: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            return self.compositionalLayout()
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 30
        layout.configuration = config
        
        return layout
    }
    
    private func compositionalLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(245))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = .init(leading: .fixed(0), top: .fixed(4), trailing: .fixed(0), bottom: .fixed(16))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(15))
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40))
        let footerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize,
                                                                        elementKind: UICollectionView.elementKindSectionFooter,
                                                                        alignment: .bottom)
        let section = NSCollectionLayoutSection(group: group)
//        let sectionBackground = NSCollectionLayoutDecorationItem.background(elementKind: RoundedBackgroundView.ReuseId)
//        section.decorationItems = [sectionBackground]
        return section
    }
    
}

extension ShopView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shopVM.providersShopList.count == 0 ? (nullLbl.isHidden = false) : (nullLbl.isHidden = true)
        return shopVM.providersShopList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.row == 0 {
//            let cell: ServiceViewCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceViewCVCell.identifier, for: indexPath) as! ServiceViewCVCell
//            cell.categories = shopVM.shopCategories
//            return cell
//        } else {
            let cell: CompanyCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: CompanyCVCell.identifier, for: indexPath) as! CompanyCVCell
            cell.compnyView.compnyNameText = shopVM.providersShopList[indexPath.item ].provider_business_name.stringValue
            cell.companies = shopVM.providersShopList[indexPath.item ]
            cell.delegate = self
            return cell
//        }
    }
}

extension ShopView: CompanyCVCellDelegate {
    
    func companySrviceSelect(productId: Int) {
        self.delegate?.openProductDetailController(productId: productId)
    }
}
