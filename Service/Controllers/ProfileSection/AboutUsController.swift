//
//  AboutUsController.swift
//  Service
//
//  Created by Hamza on 23/10/2022.
//

import UIKit

class AboutUsController: BaseController {
    
    lazy var Img = ImageView(imageName: "splash_ic")
    lazy var aboutText: UITextView = {
        let vu = UITextView()
        vu.translatesAutoresizingMaskIntoConstraints = false
        vu.backgroundColor = .clear
        vu.textAlignment = .left
        vu.font = Font.regular(16)
        vu.text = "History\nEvery business has an origin story worth telling, and usually, one that justifies why you even do business and have clients.\n\nSome centennial enterprises have pages of content that can fit in this section, while startups can tell the story of how the company was born, its challenges, and its vision for the future.\n\nServices\nOf course, you have a homepage and dedicated pages for your products, but summarizing your offerings on the About Us page is crucial to tie them in with brand values in your messaging.\n\nHighlight the benefits and showcase what you do (and why it is unique).\n\nReviews, client logos, case studies, and results bring consistency to your About Us page. It’s what really proves what you are saying is real and the impact you can bring to future clients.\n\nWith these components in mind, you will have a framework from which to build an engaging and unique About Us page."
        return vu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        baseHeadingLbl.text = "About Us"
        searchButtomView.isHidden = true
        showBackbtn(true)
        
    }
    
    func setup() {
        childView.addSubview(Img)
        childView.addSubview(aboutText)
        
        NSLayoutConstraint.activate([
            Img.centerXAnchor.constraint(equalTo: childView.centerXAnchor, constant: 0 * appConstant.widthRatio),
            Img.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 14 * appConstant.heightRatio),
            Img.widthAnchor.constraint(equalToConstant: 77 * appConstant.widthRatio),
            Img.heightAnchor.constraint(equalToConstant: 115 * appConstant.heightRatio),
            
            aboutText.topAnchor.constraint(equalTo: Img.bottomAnchor, constant: 18 * appConstant.heightRatio),
            aboutText.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            aboutText.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            aboutText.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -8 * appConstant.heightRatio),
        ])
    }

}
