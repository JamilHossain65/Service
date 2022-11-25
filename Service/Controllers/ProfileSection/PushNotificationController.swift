//
//  PushNotificationController.swift
//  Service
//
//  Created by Hamza on 23/10/2022.
//

import UIKit

class PushNotificationController: BaseController {

    lazy var languageTable = creatTable()
    
    var languageList = Languages.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }

    private func initUI() {
        baseHeadingLbl.text = "Notifications"
        searchButtomView.isHidden = true
        showBackbtn(true)
        languageTable.delegate = self
        languageTable.dataSource = self
        languageTable.register(NotificationTVCell.self, forCellReuseIdentifier: NotificationTVCell.cellidentifier)
    }
    
    private func setup() {
        childView.addSubview(languageTable)
        
        NSLayoutConstraint.activate([
            languageTable.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            languageTable.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0),
            languageTable.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            languageTable.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -8 * appConstant.heightRatio),
        ])
    }
}

extension PushNotificationController: UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTVCell.cellidentifier, for: indexPath) as! NotificationTVCell
        cell.notificatoiobImg.image = UIImage(systemName: "bell.circle.fill")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60 * appConstant.heightRatio
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
}
