//
//  ProfileDetailController.swift
//  Service
//
//  Created by Hamza on 08/10/2022.
//

import UIKit

class ProductDetailController: UIViewController {
    
    lazy var scrollbgView =  View(backgroundColor: .white,cornerRadius: 20)
    lazy var scrollView = UIScrollView()
    lazy var productImg = ImageView(imageName: "productDetail_ic")
    lazy var productNameLbl = Label(text: "Eufy X8 Hybrid Robot Vacuum(T2261K11)", font: Font.medium(18), color: theme_gray(), alignment: .left, numberOfLines: 2)
    lazy var countView = View()
    lazy var countLbl = Label(text: "1", font: Font.semiBold(20), color: .black)
    lazy var minusBtn = Button(imageName: "minuBtn_ic", cornerRadius: 18)
    lazy var plusBtn = Button(imageName: "plusBtn_ic", cornerRadius: 18)
    lazy var priceLbl = Label(text: "199.0 KD", font: Font.semiBold(20), color: .black, alignment: .right, numberOfLines: 1)
    lazy var detailHLbl = Label(text: "Details:", font: Font.medium(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var detailLbl = Label(text: "With BoostIQ™ Technology, suction power automatically increases when extra vacuuming strength is needed, such as transitioning from hard floor to carpet.", font: Font.medium(16), color: theme_gray(), alignment: .left, numberOfLines: 0)
    lazy var cartBtn = createcustomeBtn(text: "Add to Cart")
    lazy var reviewLbl = Label(text: "Reviews", font: Font.medium(16), color: .black, alignment: .left, numberOfLines: 1)
    lazy var cosmosView = ImageView(imageName: "ratting_dummy_ic")
    lazy var reviewTable = creatTable()
    lazy var compnyView = CompnyShopView.init()
    lazy var backBtn = Button(imageName: "back_ic", cornerRadius: 15)
    lazy var nullLbl = Label(text: "No review yet".localized, font: Font.medium(), color: theme_gray(), alignment: .center, numberOfLines: 1)
    
    var productDetilVM =  ProdctDetailVM()
    var productPrice = 199.0
    var count: Int = 1 {
        didSet {
            countLbl.text = "\(count)"
            priceLbl.text = "\(Double(count) * productPrice) KD"
        }
    }
    var productId: Int?
    var reviewList = [Reviews]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        setup()
    }
   
    private func initUI() {
        nullLbl.isHidden = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        giveViewShadow(countView)
        reviewTable.delegate = self
        reviewTable.dataSource = self
        reviewTable.register(RattingTVCell.self, forCellReuseIdentifier: RattingTVCell.cellidentifier)
        compnyView.compnyNameText = "YOU MAY ALSO LIKE"
        compnyView.viewAllBtn.isHidden = true
        backBtn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        plusBtn.addTarget(self, action: #selector(plusBtnTapped), for: .touchUpInside)
        minusBtn.addTarget(self, action: #selector(minusBtnTapped), for: .touchUpInside)
        cartBtn.addTarget(self, action: #selector(addCartBtnTapped), for: .touchUpInside)
        getProductDetail()
    }
    
    private func setup() {
        let margin = view.layoutMarginsGuide
        view.addSubview(scrollView)
        scrollView.addSubview(scrollbgView)
        scrollbgView.addSubview(productImg)
        scrollbgView.addSubview(productNameLbl)
        scrollbgView.addSubview(backBtn)
        scrollbgView.addSubview(countView)
        countView.addSubview(countLbl)
        countView.addSubview(minusBtn)
        countView.addSubview(plusBtn)
        scrollbgView.addSubview(priceLbl)
        scrollbgView.addSubview(detailLbl)
        scrollbgView.addSubview(detailHLbl)
        scrollbgView.addSubview(cartBtn)
        scrollbgView.addSubview(reviewLbl)
        scrollbgView.addSubview(cosmosView)
        scrollbgView.addSubview(reviewTable)
        scrollbgView.addSubview(compnyView)
        scrollbgView.addSubview(nullLbl)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: margin.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),

            scrollbgView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollbgView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollbgView.trailingAnchor.constraint(equalTo:scrollView.trailingAnchor),
            scrollbgView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollbgView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),
            
            backBtn.topAnchor.constraint(equalTo: productImg.topAnchor, constant: 8 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: productImg.leadingAnchor, constant: 26 * appConstant.widthRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
    
            productImg.topAnchor.constraint(equalTo: scrollbgView.topAnchor),
            productImg.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor),
            productImg.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor),
            productImg.heightAnchor.constraint(equalToConstant: 375 * appConstant.heightRatio),
            
            productNameLbl.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            productNameLbl.topAnchor.constraint(equalTo: productImg.bottomAnchor, constant: 22 * appConstant.heightRatio),
            productNameLbl.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            
            countView.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 15 * appConstant.heightRatio),
            countView.topAnchor.constraint(equalTo: productNameLbl.bottomAnchor, constant: 22 * appConstant.heightRatio),
            countView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            countView.widthAnchor.constraint(equalToConstant: 140 * appConstant.widthRatio),
            
            countLbl.centerYAnchor.constraint(equalTo: countView.centerYAnchor),
            countLbl.centerXAnchor.constraint(equalTo: countView.centerXAnchor),
            
            minusBtn.leadingAnchor.constraint(equalTo: countView.leadingAnchor, constant: 1 * appConstant.widthRatio),
            minusBtn.centerYAnchor.constraint(equalTo: countView.centerYAnchor),
            minusBtn.heightAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            minusBtn.widthAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            
            plusBtn.trailingAnchor.constraint(equalTo: countView.trailingAnchor, constant: -1 * appConstant.widthRatio),
            plusBtn.centerYAnchor.constraint(equalTo: countView.centerYAnchor),
            plusBtn.heightAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            plusBtn.widthAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            
            priceLbl.centerYAnchor.constraint(equalTo: countView.centerYAnchor),
            priceLbl.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            
            detailHLbl.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            detailHLbl.topAnchor.constraint(equalTo: countView.bottomAnchor, constant: 30 * appConstant.heightRatio),
            detailHLbl.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            
            detailLbl.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            detailLbl.topAnchor.constraint(equalTo: detailHLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            detailLbl.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            
            cartBtn.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 78 * appConstant.widthRatio),
            cartBtn.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -78 * appConstant.widthRatio),
            cartBtn.topAnchor.constraint(equalTo: detailLbl.bottomAnchor, constant: 22 * appConstant.heightRatio),
            cartBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            reviewLbl.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            reviewLbl.topAnchor.constraint(equalTo: cartBtn.bottomAnchor, constant: 22 * appConstant.heightRatio),
            reviewLbl.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            
            cosmosView.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            cosmosView.topAnchor.constraint(equalTo: reviewLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            cosmosView.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            reviewTable.topAnchor.constraint(equalTo: cosmosView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            reviewTable.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor),
            reviewTable.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor),
            reviewTable.heightAnchor.constraint(equalToConstant: 316 * appConstant.heightRatio),
            
            compnyView.topAnchor.constraint(equalTo: reviewTable.bottomAnchor, constant: 11 * appConstant.heightRatio),
            compnyView.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            compnyView.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor),
            compnyView.heightAnchor.constraint(equalToConstant: 0 * appConstant.heightRatio),
            compnyView.bottomAnchor.constraint(equalTo: scrollbgView.bottomAnchor, constant: -12 * appConstant.heightRatio),
            
            nullLbl.centerXAnchor.constraint(equalTo: reviewTable.centerXAnchor),
            nullLbl.centerYAnchor.constraint(equalTo: reviewTable.centerYAnchor),
        ])
    }
    
    @objc func backBtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addCartBtnTapped() {
        self.showProgres()
        productDetilVM.addToCart(request: AddToCartRequest(quantity: count, item_id: productId ?? 0)) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            let vc =  CartController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @objc func plusBtnTapped() {
        count += 1
    }
    
    @objc func minusBtnTapped() {
        if count == 1 {
            return
        }
        count -= 1
    }
    
    func getProductDetail() {
        self.showProgres()
        productDetilVM.getProductDeatil(id: productId ?? 0) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.setupProductData()
        }
    }
    
    private func setupProductData() {
        let product = productDetilVM.productDetail
        self.productNameLbl.text = product?.title
        self.productImg.kf.setImage(with: .network(URL(string: product?.image.stringValue ?? "abc")!), placeholder: UIImage(named: "image_dummy"))
        self.productPrice = Double(product?.price ?? "0.0") ?? 0.0
        self.priceLbl.text = "\(productPrice) KD"
        self.detailLbl.text = product?.description
        self.reviewList = product?.reviews ?? []
        self.reviewList.count == 0 ? (nullLbl.isHidden = false) : (nullLbl.isHidden = true)
        self.reviewTable.reloadData()
    }
}

extension ProductDetailController: UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reviewTable.dequeueReusableCell(withIdentifier: RattingTVCell.cellidentifier, for: indexPath) as! RattingTVCell
        cell.reviewLbl.text = reviewList[indexPath.row].review.stringValue
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        100 * appConstant.heightRatio
//    }
    
}
