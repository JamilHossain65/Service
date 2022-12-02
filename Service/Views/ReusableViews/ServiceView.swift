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
    
    lazy var serviceCV : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let  collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.clipsToBounds   = true
        collectionView.layer.zPosition = 3
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.isUserInteractionEnabled = true
        return collectionView
    }()
    
   
    var categoryList: [MainCategoryModel] = [] {
        didSet {
            for  _ in categoryList{
                selectedPageIndexArray.append(0)
            }
            
            //selectedPageIndexArray = [1,1,1,0]
            print("selectedPageIndexArray:::\(selectedPageIndexArray)")
            serviceCV.reloadData()
        }
    }
    
    var selectedPageIndexArray = [Int]()
    var delegate: ServiceViewDelegate?

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
        
        serviceCV.register(CustomHeaderCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                           withReuseIdentifier: "\(CustomHeaderCell.self)")
        serviceCV.register(CustomFooterCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: "\(CustomFooterCell.self)")
    }
    
    func initialize_layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(serviceCV)
        serviceCV.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    private func setupViews() {
       
    }
    
    @objc func viewAllBtnTapped(sender:UIButton) {
        let category = categoryList[sender.tag]
        self.delegate?.viewAllBtnTapped(subcategories: category.sub_categories ?? [], heading: category.category_name ?? "")
    }
    
    @objc func pageControlSelectionAction(_ sender: KMPageControl) {
        selectedPageIndexArray[sender.tag] = sender.currentPage
        
//        let tag = sender.tag / 1000
//        let currentPage = sender.tag % 1000
//        selectedPageIndexArray[tag] = currentPage
//
        print("selectedPageIndexArray:::\(selectedPageIndexArray)")
        serviceCV.reloadData()
    }
}

extension ServiceView: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let category = categoryList[indexPath.section]
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(CustomHeaderCell.self)", for: indexPath) as! CustomHeaderCell
            
            headerView.titleLabel.text = category.category_name
            headerView.allButton.tag = indexPath.section
            headerView.allButton.addTarget(self, action: #selector(viewAllBtnTapped), for: .touchUpInside)
            return headerView
        
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(CustomFooterCell.self)", for: indexPath) as! CustomFooterCell
            let subCategoryCount:Double = Double(category.sub_categories?.count ?? 0)
            let totalPages = Int(ceil(subCategoryCount * 0.25))
            
            let selectedPage = selectedPageIndexArray[indexPath.section]
            
            footerView.pageControl.numberOfPages = totalPages
            footerView.pageControl.hidesForSinglePage = true
            footerView.pageControl.tag = indexPath.section //* 1000 + selectedPage
            footerView.pageControl.addTarget(self, action: #selector(pageControlSelectionAction), for: .touchUpInside)
            return footerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 30.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let category = categoryList[section]
        let selectedPage = selectedPageIndexArray[section]
        let subCatList = category.sub_categoriesPageArray[selectedPage] as? [SubCategoryModel]
        return subCatList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = serviceCV.dequeueReusableCell(withReuseIdentifier: ServiceCVCell.identifier, for: indexPath) as! ServiceCVCell
        let category = categoryList[indexPath.section]
        let selectedPage = selectedPageIndexArray[indexPath.section]
        let subCategoryList = category.sub_categoriesPageArray[selectedPage] as? [SubCategoryModel]
        
        if let subCatList:[SubCategoryModel] = subCategoryList{
            if subCatList.count > indexPath.row {
                cell.setupData(subCatList[indexPath.row])
            }
            
        }
        //cell.setupData((category?.sub_categories?[indexPath.row])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categoryList[indexPath.section]
        
        self.delegate?.serviceSelect(id: (category.sub_categories?[indexPath.row].id)!, title: (category.sub_categories?[indexPath.row].subcategory_name)!)
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
    
//    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.item >= 3 {
//            pageControl.currentPage = 0
//        } else {
//            pageControl.currentPage = 1
//        }
//    }
    
    @objc func viewAllButtonPressed(){
        print("viewAllButtonPressed")
    }
   
}



