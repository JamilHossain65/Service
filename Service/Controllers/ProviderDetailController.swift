//
//  ProviderDetailController.swift
//  Service
//
//  Created by Hamza on 03/10/2022.
//

import UIKit

class ProviderDetailController: BaseController {
    
    lazy var scrollbgView =  View()
    lazy var scrollView = UIScrollView()
    lazy var providerNameLbl = Label(text: "Provider Name", font: Font.semiBold(16), color: .black, alignment: .left)
    lazy var provideNameTFView =  TextFieldwithButtonView()
    lazy var uploadLogoLbl = Label(text: "Upload Logo / Image", font: Font.semiBold(16), color: .black, alignment: .left)
    lazy var uploadCV = createCV()
    lazy var selectServiceLbl = Label(text: "Select Your Service", font: Font.semiBold(16), color: .black, alignment: .left)
    lazy var selectServiceTFView =  TextFieldwithButtonView()
    lazy var addDetailLbl = Label(text: "Add Details", font: Font.semiBold(16), color: .black, alignment: .left)
    lazy var detailTxtView = createTxtView(rad: 20)
    lazy var disclimerLbl = Label(text: "DISCLAIMERS", font: Font.semiBold(16), color: .black, alignment: .left)
    lazy var disclimerMsgLbl = Label(text: "A disclaimer is generally any statement intended to specify or delimit the scope of rights and obligations that may be exercised and enforced by parties in a legally recognized relationship.", font: Font.medium(12), color: .black, alignment: .left, numberOfLines: 4)
    lazy var proceedBtn = createcustomeBtn(text: "Proceed")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        detailTxtView.backgroundColor = .white
        searchButtomView.isHidden = true
        scrollbgView.backgroundColor = viewController_color()
        showBackbtn(true)
        provideNameTFView.placeholder = "Ex: Electrician, Plumber"
        selectServiceTFView.placeholder = "Ex: Electrician, Plumber"
        baseHeadingLbl.text = "Provider Details"
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        uploadCV.delegate = self
        uploadCV.dataSource = self
        uploadCV.register(MediaCVCell.self, forCellWithReuseIdentifier: MediaCVCell.identifier)
        scrollView.showsVerticalScrollIndicator = false
    }
    
    private func setup() {
        childView.addSubview(scrollView)
        scrollView.addSubview(scrollbgView)
        scrollbgView.addSubview(providerNameLbl)
        scrollbgView.addSubview(provideNameTFView)
        scrollbgView.addSubview(uploadLogoLbl)
        scrollbgView.addSubview(uploadCV)
        scrollbgView.addSubview(selectServiceLbl)
        scrollbgView.addSubview(selectServiceTFView)
        scrollbgView.addSubview(addDetailLbl)
        scrollbgView.addSubview(detailTxtView)
        scrollbgView.addSubview(disclimerLbl)
        scrollbgView.addSubview(disclimerMsgLbl)
        scrollbgView.addSubview(proceedBtn)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: childView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: childView.bottomAnchor),
            scrollView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),

            scrollbgView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollbgView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollbgView.trailingAnchor.constraint(equalTo:scrollView.trailingAnchor),
            scrollbgView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollbgView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),
            
            providerNameLbl.topAnchor.constraint(equalTo: scrollbgView.topAnchor, constant: 88 * appConstant.heightRatio),
            providerNameLbl.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            
            provideNameTFView.leadingAnchor.constraint(equalTo: providerNameLbl.leadingAnchor),
            provideNameTFView.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            provideNameTFView.topAnchor.constraint(equalTo: providerNameLbl.bottomAnchor, constant: 11 * appConstant.heightRatio),
            provideNameTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            uploadLogoLbl.topAnchor.constraint(equalTo: provideNameTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            uploadLogoLbl.leadingAnchor.constraint(equalTo: providerNameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            
            uploadCV.leadingAnchor.constraint(equalTo: providerNameLbl.leadingAnchor),
            uploadCV.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -11 * appConstant.widthRatio),
            uploadCV.topAnchor.constraint(equalTo: uploadLogoLbl.bottomAnchor, constant: 11 * appConstant.heightRatio),
            uploadCV.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
            
            selectServiceLbl.topAnchor.constraint(equalTo: uploadCV.bottomAnchor, constant: 20 * appConstant.heightRatio),
            selectServiceLbl.leadingAnchor.constraint(equalTo: providerNameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            
            selectServiceTFView.leadingAnchor.constraint(equalTo: providerNameLbl.leadingAnchor),
            selectServiceTFView.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            selectServiceTFView.topAnchor.constraint(equalTo: selectServiceLbl.bottomAnchor, constant: 11 * appConstant.heightRatio),
            selectServiceTFView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            addDetailLbl.topAnchor.constraint(equalTo: selectServiceTFView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            addDetailLbl.leadingAnchor.constraint(equalTo: providerNameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            
            detailTxtView.leadingAnchor.constraint(equalTo: providerNameLbl.leadingAnchor),
            detailTxtView.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            detailTxtView.topAnchor.constraint(equalTo: addDetailLbl.bottomAnchor, constant: 11 * appConstant.heightRatio),
            detailTxtView.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
            
            disclimerLbl.leadingAnchor.constraint(equalTo: providerNameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            disclimerLbl.topAnchor.constraint(equalTo: detailTxtView.bottomAnchor, constant: 20 * appConstant.heightRatio),
        
            disclimerMsgLbl.leadingAnchor.constraint(equalTo: disclimerLbl.leadingAnchor),
            disclimerMsgLbl.topAnchor.constraint(equalTo: disclimerLbl.bottomAnchor, constant: 11 * appConstant.heightRatio),
            disclimerMsgLbl.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            
            proceedBtn.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor, constant: 78 * appConstant.widthRatio),
            proceedBtn.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor, constant: -78 * appConstant.widthRatio),
            proceedBtn.topAnchor.constraint(equalTo: disclimerMsgLbl.bottomAnchor, constant: 11 * appConstant.heightRatio),
            proceedBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            proceedBtn.bottomAnchor.constraint(equalTo: scrollbgView.bottomAnchor, constant: -12 * appConstant.heightRatio),
        ])
        
    }
}

extension ProviderDetailController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCVCell.identifier, for: indexPath) as! MediaCVCell
        if indexPath.row == 0 {
            cell.serviceImg.image = UIImage(named: "plus_ic")
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100 * appConstant.widthRatio, height: 100 * appConstant.heightRatio )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 * appConstant.widthRatio
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0 * appConstant.widthRatio, bottom: 0 * appConstant.heightRatio, right: 2 * appConstant.widthRatio)
    }
}




