//
//  SelectTypeController.swift
//  Service
//
//  Created by Hamza on 11/11/2022.
//

import UIKit

class SelectTypeController: UIViewController {
    
    lazy var headerImg = ImageView(imageName: "splash_ic")
    lazy var userBtn = createcustomeBtn(text:  "User")
    lazy var providerBtn = createcustomeBtn(text:  "Provider")
    lazy var btnStack = StackView(backgroundColor: .clear, cornerRadius: 0, distribution: .fillEqually, spacing: 15 * appConstant.widthRatio, axis: .horizontal)
    lazy var countinueLbl = Label(text: "Countinue as", font: Font.semiBold(16), color: .black)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    }
    
    private func initUI() {
        userBtn.addTarget(self, action: #selector(userBtnTapped), for: .touchUpInside)
        providerBtn.addTarget(self, action: #selector(providerBtnTapped), for: .touchUpInside)
        setup()
    }
    
    private func setup() {
        let margin = view.layoutMarginsGuide
        view.addSubview(headerImg)
        view.addSubview(countinueLbl)
        view.addSubview(btnStack)
        btnStack.addArrangedSubview(userBtn)
        btnStack.addArrangedSubview(providerBtn)
        
        NSLayoutConstraint.activate([
            headerImg.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0 * appConstant.widthRatio),
            headerImg.topAnchor.constraint(equalTo: margin.topAnchor, constant: 150 * appConstant.heightRatio),
            headerImg.widthAnchor.constraint(equalToConstant: 200 * appConstant.widthRatio),
            headerImg.heightAnchor.constraint(equalToConstant: 300 * appConstant.heightRatio),
            
            countinueLbl.bottomAnchor.constraint(equalTo: btnStack.topAnchor, constant: -30 * appConstant.heightRatio),
            countinueLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            btnStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28 * appConstant.widthRatio),
            btnStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28 * appConstant.widthRatio),
            btnStack.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -33 * appConstant.heightRatio),
            btnStack.heightAnchor.constraint(equalToConstant: 55 * appConstant.heightRatio),
        ])
    }
    
    @objc func userBtnTapped() {
        UserDefaults.standard.setValue(true, forKey: UserDefaults.AppUserDefault.isUser)
        self.navigationController?.pushViewController(OnBoardingController(), animated: true)
    }
    
    @objc func providerBtnTapped() {
        UserDefaults.standard.setValue(false, forKey: UserDefaults.AppUserDefault.isUser)
        self.navigationController?.pushViewController(OnBoardingController(), animated: true)
    }

}
