//
//  BaseController.swift
//  Service
//
//  Created by Hamza on 28/09/2022.
//

import UIKit

class BaseController: UIViewController {
    
    lazy var headertop = View(backgroundColor: theme_color())
    lazy var headerView = View(backgroundColor: theme_color(),cornerRadius: 30)
    lazy var searchButtomView = View(backgroundColor: tf_border(),cornerRadius: 30)
    lazy var searchView = View(backgroundColor: .white,cornerRadius: 20)
    lazy var childView = View(backgroundColor: viewController_color())
    lazy var headerImg = ImageView(imageName: "splash_ic")
    lazy var searchTF = createTF(placeHolder: "What Services are you looking for?")
    lazy var searchImg = ImageView(imageName: "search_ic")
    lazy var backBtn = Button(imageName: "back_ic", cornerRadius: 15)
    lazy var baseHeadingLbl = Label(text: "Electricians", font: Font.medium(20), color: .black)
    lazy var requestDetailView = View(backgroundColor: tf_border(),cornerRadius: 30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initBaseUI()
        setupBase()
    }
    
    private func initBaseUI() {
        requestDetailView.isHidden = true
        baseHeadingLbl.isHidden = true
        backBtn.isHidden = true
        searchTF.attributedPlaceholder = NSAttributedString(
            string: "What Services are you looking for?",
            attributes: [NSAttributedString.Key.foregroundColor: theme_gray()]
        )
        backBtn.addTarget(self, action: #selector(backbtnTapped), for: .touchUpInside)
    }
    
    private func setupBase() {
        let margin = view.layoutMarginsGuide
        view.addSubview(childView)
        view.addSubview(requestDetailView)
        view.addSubview(searchButtomView)
        searchButtomView.addSubview(searchView)
        searchView.addSubview(searchTF)
        searchView.addSubview(searchImg)
        view.addSubview(headerView)
        headerView.addSubview(headerImg)
        headerView.addSubview(backBtn)
        headerView.addSubview(baseHeadingLbl)
        view.addSubview(headertop)
        
        NSLayoutConstraint.activate([
            headertop.bottomAnchor.constraint(equalTo: margin.topAnchor, constant: 0 * appConstant.heightRatio),
            headertop.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            headertop.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            headertop.topAnchor.constraint(equalTo: view.topAnchor),
            
            childView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 * appConstant.heightRatio),
            childView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            childView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            childView.topAnchor.constraint(equalTo: margin.topAnchor),
            
            headerView.topAnchor.constraint(equalTo: margin.topAnchor, constant: -30 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0  * appConstant.heightRatio),
            headerView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: 0  * appConstant.heightRatio),
            headerView.heightAnchor.constraint(equalToConstant: 88 * appConstant.heightRatio),
            
            backBtn.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26 * appConstant.widthRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            
            baseHeadingLbl.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -6 * appConstant.heightRatio),
            baseHeadingLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            baseHeadingLbl.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 8 * appConstant.widthRatio),
            
            headerImg.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerImg.widthAnchor.constraint(equalToConstant: 24 * appConstant.widthRatio),
            headerImg.heightAnchor.constraint(equalToConstant: 37 * appConstant.heightRatio),
            headerImg.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -6 * appConstant.heightRatio),
            
            searchButtomView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -30 * appConstant.heightRatio),
            searchButtomView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0  * appConstant.heightRatio),
            searchButtomView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: 0  * appConstant.heightRatio),
            searchButtomView.heightAnchor.constraint(equalToConstant: 88 * appConstant.heightRatio),
            
            searchView.bottomAnchor.constraint(equalTo: searchButtomView.bottomAnchor, constant: -11 * appConstant.heightRatio),
            searchView.leadingAnchor.constraint(equalTo: searchButtomView.leadingAnchor, constant: 15  * appConstant.heightRatio),
            searchView.trailingAnchor.constraint(equalTo: searchButtomView.trailingAnchor, constant: -15  * appConstant.heightRatio),
            searchView.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            searchTF.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 16 * appConstant.widthRatio),
            searchTF.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 5 * appConstant.heightRatio),
            searchTF.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -5 * appConstant.heightRatio),
            searchTF.trailingAnchor.constraint(equalTo: searchImg.leadingAnchor, constant: -8 * appConstant.widthRatio),
            
            searchImg.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchImg.widthAnchor.constraint(equalToConstant: 19 * appConstant.widthRatio),
            searchImg.heightAnchor.constraint(equalToConstant: 19 * appConstant.heightRatio),
            searchImg.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -15 * appConstant.heightRatio),
            
            requestDetailView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -30 * appConstant.heightRatio),
            requestDetailView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0  * appConstant.heightRatio),
            requestDetailView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: 0  * appConstant.heightRatio),
            requestDetailView.heightAnchor.constraint(equalToConstant: 313 * appConstant.heightRatio),
            

        ])
    }
    
    func showBackbtn(_ show: Bool) {
        
        if show {
            backBtn.isHidden = false
            baseHeadingLbl.isHidden = false
            headerImg.isHidden = true
        } else {
            backBtn.isHidden = true
            baseHeadingLbl.isHidden = true
            headerImg.isHidden = false
        }
        
    }
    
    @objc func backbtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
        
}
