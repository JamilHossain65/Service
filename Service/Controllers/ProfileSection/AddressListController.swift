//
//  AddressListController.swift
//  Service
//
//  Created by Hamza on 23/10/2022.
//

import UIKit

class AddressListController: BaseController {
    
    lazy var languageTable = creatTable()
    lazy var addBtn = Button(imageName: "plus", text: "".localized, backgroundColor: .clear, imageTintColor: .white)
    lazy var nullLbl = Label(text: "No Address Found\nPlease add new".localized, font: Font.medium(), color: theme_gray(), alignment: .center, numberOfLines: 1)
    
    let addressVM = AddressVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAddressList()
    }
    
    private func initUI() {
        nullLbl.isHidden = true
        baseHeadingLbl.text = "Address"
        searchButtomView.isHidden = true
        showBackbtn(true)
        languageTable.delegate = self
        languageTable.dataSource = self
        languageTable.register(AddressTVCell.self, forCellReuseIdentifier: AddressTVCell.cellidentifier)
        addBtn.addTarget(self, action: #selector(addBtnTapped), for: .touchUpInside)
        
    }
    
    private func setup() {
        childView.addSubview(languageTable)
        headerView.addSubview(addBtn)
        childView.addSubview(nullLbl)
        
        NSLayoutConstraint.activate([
            languageTable.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            languageTable.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0),
            languageTable.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            languageTable.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -8 * appConstant.heightRatio),
            
            addBtn.centerYAnchor.constraint(equalTo: baseHeadingLbl.centerYAnchor),
            addBtn.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24 * appConstant.widthRatio),
            addBtn.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            addBtn.widthAnchor.constraint(equalToConstant: 36 * appConstant.widthRatio),
            
            nullLbl.centerYAnchor.constraint(equalTo: childView.centerYAnchor),
            nullLbl.centerXAnchor.constraint(equalTo: childView.centerXAnchor),
        ])
    }
    
    @objc func addBtnTapped() {
        self.navigationController?.pushViewController(AddAddressController(), animated: true)
    }
    
    
    private func getAddressList() {
        self.showProgres()
        addressVM.getAddressList { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.addressVM.addressList.count == 0 ? (self.nullLbl.isHidden = false) : (self.nullLbl.isHidden = true)
            self.languageTable.reloadData()
        }
    }
    
    
}

extension AddressListController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        addressVM.addressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddressTVCell.cellidentifier, for: indexPath) as! AddressTVCell
        cell.setupCell(address: addressVM.addressList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120 * appConstant.heightRatio
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
}


