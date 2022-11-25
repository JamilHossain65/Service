//
//  ProductOrderController.swift
//  Service
//
//  Created by Hamza on 23/10/2022.
//

import UIKit

class ProductOrderController: BaseController {
    
    lazy var languageTable = creatTable()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        baseHeadingLbl.text = "Product Order"
        searchButtomView.isHidden = true
        showBackbtn(true)
        languageTable.delegate = self
        languageTable.dataSource = self
        languageTable.register(ProductOrderTVCell.self, forCellReuseIdentifier: ProductOrderTVCell.cellidentifier)
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

extension ProductOrderController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductOrderTVCell.cellidentifier, for: indexPath) as! ProductOrderTVCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200 * appConstant.heightRatio
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
}

