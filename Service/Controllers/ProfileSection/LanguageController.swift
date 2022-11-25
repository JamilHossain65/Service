//
//  LanguageController.swift
//  Service
//
//  Created by Hamza on 23/10/2022.
//

import UIKit

class LanguageController: BaseController {

    lazy var languageTable = creatTable()
    lazy var submitBtn = createcustomeBtn(text: "Confirm")
    
    var languageList = Languages.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }

    private func initUI() {
        baseHeadingLbl.text = "Language"
        searchButtomView.isHidden = true
        showBackbtn(true)
        languageTable.delegate = self
        languageTable.dataSource = self
        languageTable.register(LanguageTVCell.self, forCellReuseIdentifier: LanguageTVCell.cellidentifier)
    }
    
    private func setup() {
        childView.addSubview(languageTable)
        childView.addSubview(submitBtn)
        
        NSLayoutConstraint.activate([
            languageTable.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            languageTable.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0),
            languageTable.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            languageTable.bottomAnchor.constraint(equalTo: submitBtn.topAnchor, constant: -8 * appConstant.heightRatio),
            
            submitBtn.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -29 * appConstant.heightRatio),
            submitBtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 77 * appConstant.widthRatio),
            submitBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -77 * appConstant.widthRatio),
            submitBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
        ])
    }
}

extension LanguageController: UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        languageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LanguageTVCell.cellidentifier, for: indexPath) as! LanguageTVCell
        cell.languageLbl.text = languageList[indexPath.row].rawValue.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40 * appConstant.heightRatio
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
}

