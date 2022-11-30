//
//  HomeController.swift
//  Service
//
//  Created by Hamza on 28/09/2022.
//

import UIKit
import SnapKit

class HomeController: BaseController {
    
    lazy var repareView = ServiceView.init()
    lazy var scrollbgView =  View()
    lazy var scrollView = UIScrollView()
    
    var homeVM = HomeVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
        
    }
    
    private func initUI() {
        scrollbgView.backgroundColor = viewController_color()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        
        repareView.delegate = self
        getData()
    }
    
    private func setup() {
        childView.addSubview(scrollView)
        scrollView.addSubview(scrollbgView)
        scrollbgView.addSubview(repareView)
        
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
            
            repareView.topAnchor.constraint(equalTo: scrollbgView.topAnchor, constant: 80 * appConstant.heightRatio),
            repareView.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor),
            repareView.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor),
            repareView.heightAnchor.constraint(equalToConstant: 500 * appConstant.heightRatio),
            repareView.bottomAnchor.constraint(equalTo: scrollbgView.bottomAnchor),
        ])
        
//        repareView.snp.makeConstraints{make in
//            make.top.equalToSuperview().offset(80 * appConstant.heightRatio)
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.bottom.equalToSuperview()
//        }
    }
    
    func getData() {
        self.showProgres()
        homeVM.getDashboard { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            
            self.repareView.categoryList = self.homeVM.catgoriesList
            self.repareView.serviceCV.reloadData()
        }
    }
}

extension HomeController: ServiceViewDelegate {
    
    func viewAllBtnTapped(subcategories: [SubCategoryModel], heading: String) {
        let vc = ViewAllController()
        vc.heading = heading
        vc.categories = subcategories
        if let nav:UINavigationController = self.navigationController?.visibleViewController?.parent as? UINavigationController {
            nav.pushViewController(vc, animated: true)
        }
    }
    
    func serviceSelect(id: Int, title: String) {
        let vc = CalanderController()
        vc.categoryId = id
        vc.headingTitle = title
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

