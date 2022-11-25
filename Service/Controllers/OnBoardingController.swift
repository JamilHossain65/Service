//
//  IntroController.swift
//  Service
//
//  Created by Hamza on 27/09/2022.
//

import UIKit
import KMPageControl

class OnBoardingController: UIViewController {

    lazy var engBtbn = createcustomeBtn(text:  "English")
    lazy var arbiBtbn = createcustomeBtn(text:  "العربية")
    lazy var skipBtbn = Button(text: "Skip", textColor: theme_gray())
    lazy var btnStack = StackView(backgroundColor: .clear, cornerRadius: 0, distribution: .fillEqually, spacing: 15 * appConstant.widthRatio, axis: .horizontal)
    
    lazy var bannerView: KMBannerView = {
        let banner = KMBannerView()
        banner.translatesAutoresizingMaskIntoConstraints = false
           return banner
       }()
    
    let onbaordImages = ["onboard1","onboard2","onboard3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    }
    
    func initUI() {
        bannerView.banners = (onbaordImages).map({ (idx) in
            let img = UIImage(named: idx)
            return KMBannerView.Banner(image: img, url: nil)
        })
        
        engBtbn.addTarget(self, action: #selector(engBtn_tapped), for: .touchUpInside)
        arbiBtbn.addTarget(self, action: #selector(arbiBtn_tapped), for: .touchUpInside)
        setup()
        
    }
    
    func setup() {
        let margin = view.layoutMarginsGuide
        view.addSubview(btnStack)
        btnStack.addArrangedSubview(engBtbn)
        btnStack.addArrangedSubview(arbiBtbn)
        view.addSubview(skipBtbn)
        view.addSubview(bannerView)
        
        NSLayoutConstraint.activate([
            btnStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28 * appConstant.widthRatio),
            btnStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28 * appConstant.widthRatio),
            btnStack.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -33 * appConstant.heightRatio),
            btnStack.heightAnchor.constraint(equalToConstant: 55 * appConstant.heightRatio),
            
            skipBtbn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skipBtbn.bottomAnchor.constraint(equalTo: btnStack.topAnchor, constant: -30 * appConstant.heightRatio),
            skipBtbn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            skipBtbn.widthAnchor.constraint(equalToConstant: 100 * appConstant.widthRatio),
            
            bannerView.topAnchor.constraint(equalTo: margin.topAnchor, constant: 60 * appConstant.heightRatio),
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bannerView.bottomAnchor.constraint(equalTo: skipBtbn.topAnchor,constant: -30 * appConstant.heightRatio),
        ])
    }
    
    @objc func engBtn_tapped() {
        self.navigationController?.pushViewController(LoginController(), animated: true)
    }
    
    @objc func arbiBtn_tapped() {
        self.navigationController?.pushViewController(LoginController(), animated: true)
    }

}
