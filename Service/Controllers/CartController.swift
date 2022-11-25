//
//  CartController.swift
//  Service
//
//  Created by Hamza on 08/10/2022.
//

import UIKit

class CartController: BaseController {

//    lazy var scrollbgView =  View(backgroundColor: .white,cornerRadius: 20)
//    lazy var scrollView = UIScrollView()
    lazy var btnView = View(backgroundColor: .black,cornerRadius: 30)
    lazy var priceView = View(backgroundColor: theme_color(),cornerRadius: 30)
    lazy var countinueBtn = createcustomeBtn(text: "Continue shoping", bgColor: .white)
    lazy var checkoutBtn = createcustomeBtn(text: "Checkout")
    lazy var btnStack = StackView(backgroundColor: .clear, cornerRadius: 0, distribution: .fillEqually, spacing: 15 * appConstant.widthRatio, axis: .horizontal)
    lazy var totalAmountLbl = Label(text: "Total Amount", font: Font.semiBold(20), color: .black, alignment: .right, numberOfLines: 1)
    lazy var priceLbl = Label(text: "199.0 KD", font: Font.semiBold(20), color: .black, alignment: .right, numberOfLines: 1)
    lazy var cartTable = creatTable()
    lazy var nullLbl = Label(text: "Cart empty".localized, font: Font.medium(), color: theme_gray(), alignment: .center, numberOfLines: 1)
    
    var productDetilVM =  ProdctDetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }

    private func initUI() {
        nullLbl.isHidden = true
        view.backgroundColor = .black
        baseHeadingLbl.text = "Chart"
        searchButtomView.isHidden = true
        showBackbtn(true)
        cartTable.delegate = self
        cartTable.dataSource = self
        cartTable.register(CartTVCell.self, forCellReuseIdentifier: CartTVCell.cellidentifier)
        checkoutBtn.addTarget(self, action: #selector(checkoutBtnTapped), for: .touchUpInside)
        getCart()
    }
    
    private func setup() {
        let margin = view.layoutMarginsGuide
        childView.addSubview(priceView)
        priceView.addSubview(totalAmountLbl)
        priceView.addSubview(priceLbl)
        childView.addSubview(btnView)
        btnView.addSubview(btnStack)
        btnStack.addArrangedSubview(countinueBtn)
        btnStack.addArrangedSubview(checkoutBtn)
        childView.addSubview(cartTable)
        childView.addSubview(nullLbl)
        
        NSLayoutConstraint.activate([
            btnView.bottomAnchor.constraint(equalTo: childView.bottomAnchor),
            btnView.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            btnView.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            btnView.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
            
            priceView.bottomAnchor.constraint(equalTo: childView.bottomAnchor),
            priceView.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            priceView.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            priceView.heightAnchor.constraint(equalToConstant: 140 * appConstant.heightRatio),
            
            btnStack.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            btnStack.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            btnStack.centerYAnchor.constraint(equalTo: btnView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            btnStack.heightAnchor.constraint(equalToConstant: 55 * appConstant.heightRatio),
            
            totalAmountLbl.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: 31 * appConstant.widthRatio),
            totalAmountLbl.topAnchor.constraint(equalTo: priceView.topAnchor, constant: 9 * appConstant.heightRatio),
            
            priceLbl.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -31 * appConstant.widthRatio),
            priceLbl.topAnchor.constraint(equalTo: priceView.topAnchor, constant: 9 * appConstant.heightRatio),
         
            cartTable.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8 * appConstant.heightRatio),
            cartTable.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            cartTable.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            cartTable.bottomAnchor.constraint(equalTo: priceView.topAnchor),
            
            nullLbl.centerXAnchor.constraint(equalTo: cartTable.centerXAnchor),
            nullLbl.centerYAnchor.constraint(equalTo: cartTable.centerYAnchor),
        ])
    }
    
    @objc func checkoutBtnTapped() {
        let vc = CartCheckoutController()
        vc.cartParice = self.productDetilVM.cartPrice 
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getCart() {
        self.showProgres()
        productDetilVM.getCart() { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.productDetilVM.cartList.count == 0 ? (self.nullLbl.isHidden = false) : (self.nullLbl.isHidden = true)
            self.priceLbl.text = "\(self.productDetilVM.cartPrice) KD"
            self.cartTable.reloadData()
        }
    }

}

extension CartController: UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productDetilVM.cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTVCell.cellidentifier, for: indexPath) as! CartTVCell
        cell.setupCellData(cart: productDetilVM.cartList[indexPath.row])
        cell.deleteBtn.tag = indexPath.row
        cell.plusBtn.tag = indexPath.row
        cell.minusBtn.tag = indexPath.row
        cell.deleteBtn.addTarget(self, action: #selector(itemDeleteFromCart), for: .touchUpInside)
        cell.plusBtn.addTarget(self, action: #selector(itemPlusFromCart), for: .touchUpInside)
        cell.minusBtn.addTarget(self, action: #selector(itemMinusFromCart), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160 * appConstant.heightRatio
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension CartController {
    
    @objc func itemDeleteFromCart(_ sender: UIButton) {
        let id = productDetilVM.cartList[sender.tag].id ?? 0
        self.showProgres()
        productDetilVM.deleteCart(id: id) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.getCart()
        }
    }
    
    @objc func itemPlusFromCart(_ sender: UIButton) {
        let id = productDetilVM.cartList[sender.tag].id ?? 0
        self.showProgres()
        productDetilVM.plusCart(id: id) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.getCart()
        }
    }
    
    @objc func itemMinusFromCart(_ sender: UIButton) {
        let id = productDetilVM.cartList[sender.tag].id ?? 0
        self.showProgres()
        productDetilVM.minusCart(id: id) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.getCart()
        }
    }
}
