//
//  ViewAllController.swift
//  Service
//
//  Created by Hamza on 29/09/2022.
//

import UIKit

class ViewAllController: BaseController {
    
    lazy var serviceCV : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
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
    
    var heading: String = "" {
        didSet {
            baseHeadingLbl.text = heading
        }
    }
    
    var categories: [SubCategoryModel]? {
        didSet {
            serviceCV.reloadData()
        }
    }
    
    var serviceList: [ServiceModel]? {
        didSet {
            serviceCV.reloadData()
        }
    }
    var isSearching: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        
//        self.navigationController?.isNavigationBarHidden = true;
//    }
    
    private func initUI() {
        showBackbtn(true)
        serviceCV.delegate = self
        serviceCV.dataSource = self
        serviceCV.register(SubcategoryCVCell.self, forCellWithReuseIdentifier: SubcategoryCVCell.identifier)
    }
    
    private func setup() {
        childView.addSubview(serviceCV)
        
        NSLayoutConstraint.activate([
            serviceCV.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            serviceCV.topAnchor.constraint(equalTo: searchButtomView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            serviceCV.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            serviceCV.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -14 * appConstant.heightRatio),
        ])
    }

}

extension ViewAllController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isSearching{
//            let cell = serviceCV.dequeueReusableCell(withReuseIdentifier: ServiceCVCell.identifier, for: indexPath) as! ServiceCVCell
//            cell.setupData((categories?[indexPath.row])!)
//            return cell
        }
        
        let cell = serviceCV.dequeueReusableCell(withReuseIdentifier: SubcategoryCVCell.identifier, for: indexPath) as! SubcategoryCVCell
        cell.setupData((categories?[indexPath.row])!)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CalanderController()
        vc.categoryId = categories?[indexPath.row].id ?? 0
        vc.headingTitle = categories?[indexPath.row].subcategory_name ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
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
}



