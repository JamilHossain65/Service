//
//  ShopNewController.swift
//  Service
//
//  Created by Hamza on 11/11/2022.
//

import UIKit

class ShopNewController: BaseController {
    
    lazy var shopView = ShopView()
    lazy var cartBtn = Button(imageName: "cart_ic", cornerRadius: 15)
    
    var shopVM = ShopVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        searchButtomView.isHidden = true
        childView.backgroundColor = .white
        shopView.delegate = self
        shopView.shopVM = self.shopVM
        shopView.translatesAutoresizingMaskIntoConstraints = false
        cartBtn.addTarget(self, action: #selector(cartBtntapped), for: .touchUpInside)
        cartBtn.clipsToBounds = true
        setup()
        getData()
    }
    
    private func setup() {
        childView.addSubview(shopView)
        headerView.addSubview(cartBtn)
        
        NSLayoutConstraint.activate([
            shopView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            shopView.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            shopView.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            shopView.bottomAnchor.constraint(equalTo: childView.bottomAnchor),
            
            cartBtn.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8 * appConstant.heightRatio),
            cartBtn.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -26 * appConstant.widthRatio),
            cartBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            cartBtn.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
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
            self.shopView.collectionView.reloadData()
        }
    }
    
    @objc func cartBtntapped() {
        let vc =  CartController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ShopNewController: ShopViewDelegate {
    
    func openProductDetailController(productId: Int) {
        let vc = ProductDetailController()
        vc.productId = productId
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
