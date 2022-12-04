//
//  ShopController.swift
//  Service
//
//  Created by Hamza on 29/09/2022.
//

import UIKit

class ShopController: BaseController {
    
    lazy var helloLbl = Label(text: "Hello!!", font: Font.medium(24), color: .black)
    lazy var descLbl = Label(text: "What Services are you looking for?", font: Font.medium(14), color: theme_gray())
    lazy var categoryView = ServiceView.init()
    lazy var compny1View = CompnyShopView.init()
    lazy var compny2View = CompnyShopView.init()
    lazy var scrollbgView =  View()
    lazy var scrollView = UIScrollView()
    
    var shopVM = ShopVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
        getData()
    }
    
    private func initUI() {
        searchButtomView.isHidden = true
        scrollbgView.backgroundColor = viewController_color()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        categoryView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        compny1View.compnyNameText = "Q8 Electronics"
        compny2View.compnyNameText = "ABC Company"
        categoryView.delegate = self
        compny1View.delegate = self
        compny2View.delegate = self
    }
    
    private func setup() {
        childView.addSubview(scrollView)
        scrollView.addSubview(scrollbgView)
        scrollbgView.addSubview(helloLbl)
        scrollbgView.addSubview(descLbl)
        scrollbgView.addSubview(categoryView)
        scrollbgView.addSubview(compny1View)
        scrollbgView.addSubview(compny2View)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: childView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: childView.bottomAnchor),
            scrollView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),
            
            scrollbgView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60 * appConstant.heightRatio),
            scrollbgView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollbgView.trailingAnchor.constraint(equalTo:scrollView.trailingAnchor),
            scrollbgView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollbgView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),
            
            helloLbl.topAnchor.constraint(equalTo: scrollbgView.topAnchor, constant: 28 * appConstant.heightRatio),
            helloLbl.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 13 * appConstant.widthRatio),
            helloLbl.heightAnchor.constraint(equalToConstant: 35 * appConstant.heightRatio),
            
            descLbl.topAnchor.constraint(equalTo: helloLbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            descLbl.leadingAnchor.constraint(equalTo: helloLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
//            descLbl.heightAnchor.constraint(equalToConstant: 22 * appConstant.heightRatio),
            
            categoryView.topAnchor.constraint(equalTo: descLbl.bottomAnchor, constant: 12 * appConstant.heightRatio),
            categoryView.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor),
            categoryView.heightAnchor.constraint(equalToConstant: 200 * appConstant.heightRatio),
            
            compny1View.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 0 * appConstant.heightRatio),
            compny1View.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor),
            compny1View.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor),
            compny1View.heightAnchor.constraint(equalToConstant: 245 * appConstant.heightRatio),
            
            compny2View.topAnchor.constraint(equalTo: compny1View.bottomAnchor, constant: 0 * appConstant.heightRatio),
            compny2View.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor),
            compny2View.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor),
            compny2View.heightAnchor.constraint(equalToConstant: 245 * appConstant.heightRatio),
            compny2View.bottomAnchor.constraint(equalTo: scrollbgView.bottomAnchor, constant: -12 * appConstant.heightRatio),
            
        ])
    }
    
    private func getData() {
        self.showProgres()
        shopVM.getShopData() { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
        }
    }
    
}

extension ShopController: ServiceViewDelegate, CompnayShopViewDelegate {
    func didTapPageControll(_ serviceView: ServiceView, currentPage: Int) {
        
    }
    
    func viewAllBtnTapped(subcategories: [SubCategoryModel], heading: String) {
        let vc = ViewAllController()
        vc.heading = heading
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func serviceSelect(id: Int, title: String) {
        let vc = CalanderController()
        vc.categoryId = id
        vc.headingTitle = title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func viewAllShopBtnTapped(subcategories: [SubCategoryModel], heading: String) {
      
    }
    
    func serviceShopSelect() {
        self.navigationController?.pushViewController(ProductDetailController(), animated: true)
    }
}
