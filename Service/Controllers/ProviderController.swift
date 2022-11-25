//
//  ProviderController.swift
//  Service
//
//  Created by Hamza on 03/10/2022.
//

import UIKit

class ProviderController: BaseController {
    
    lazy var viewAllBtn = Button(text: "View all", textColor: redText_color())
    lazy var providerTable = creatTable()
    lazy var sendBtn = createcustomeBtn(text:  "Send")
    lazy var nullLbl = Label(text: "No Data Found".localized, font: Font.medium(), color: theme_gray(), alignment: .center, numberOfLines: 1)
    
    let serviceVM = SelectServiceVM()
    
    var selectedProviders: [Int] = []
    var categoryId: Int = 0
    var date: String = ""
    var hour: String = ""
    var time: String = ""
    var note: String = ""
    var headingTitle: String = ""
    var mediaList: [UIImage]?

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        nullLbl.isHidden = true
        baseHeadingLbl.text = headingTitle
        searchButtomView.isHidden = true
        showBackbtn(true)
        sendBtn.addTarget(self, action: #selector(proceedBtnTapped), for: .touchUpInside)
        providerTable.delegate = self
        providerTable.dataSource = self
        providerTable.register(ProviderTVCell.self, forCellReuseIdentifier: ProviderTVCell.cellidentifier)
        getData()
        viewAllBtn.isHidden = true
    }
    private func setup() {
        childView.addSubview(viewAllBtn)
        childView.addSubview(providerTable)
        childView.addSubview(sendBtn)
        childView.addSubview(nullLbl)
        
        NSLayoutConstraint.activate([
            viewAllBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -26 * appConstant.widthRatio),
            viewAllBtn.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 13 * appConstant.heightRatio),
            
            providerTable.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            providerTable.topAnchor.constraint(equalTo: viewAllBtn.bottomAnchor, constant: 12 * appConstant.heightRatio),
            providerTable.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            providerTable.bottomAnchor.constraint(equalTo: sendBtn.topAnchor, constant: -14 * appConstant.heightRatio),
            
            sendBtn.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -29 * appConstant.heightRatio),
            sendBtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 77 * appConstant.widthRatio),
            sendBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -77 * appConstant.widthRatio),
            sendBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            nullLbl.centerYAnchor.constraint(equalTo: childView.centerYAnchor),
            nullLbl.centerXAnchor.constraint(equalTo: childView.centerXAnchor),
        ])
    }
    
    @objc func proceedBtnTapped() {
        createRequest()
    }
    
    private func getData() {
        self.showProgres()
        serviceVM.getServiceList(id: "2") { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.serviceVM.serviceList.count == 0 ? (self.nullLbl.isHidden = false) : (self.nullLbl.isHidden = true)
            self.providerTable.reloadData()
        }
    }
    
    func createRequest() {
        let request = MultipartFormDataRequest(url: URL(string: API.baseUrl + "user/request-service")!)
        request.addDataField(named: "request_media", data: (self.mediaList?.first?.pngData()  ?? Data()) , mimeType: "img/png", key: "request_media")
        request.addTextField(named: "request_service_date", value: self.date as String)
        request.addTextField(named: "request_service_time", value: self.time as String)
        request.addTextField(named: "no_of_hours", value: self.hour as String)
        request.addTextField(named: "request_query", value: self.note as String)
        request.addTextField(named: "request_status", value: "1" as String)
        request.addTextField(named: "request_select_provider", value: "1,2,3" as String)
        request.addTextField(named: "user_id", value: String(LoggedUserDetails.shared.user?.id ?? 0) as String)
        self.showProgres()
        serviceVM.saveRequest(request: request) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.navigationController?.pushViewController(RequestSubmittedController(), animated: true)
        }
        
    }
}

extension ProviderController: UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
       1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        serviceVM.serviceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProviderTVCell.cellidentifier, for: indexPath) as! ProviderTVCell
        (indexPath.row % 2 == 0) ? (cell.tickImg.isHidden = true) : (cell.tickImg.isHidden = false)
        cell.nameLbl.text = serviceVM.serviceList[indexPath.row].service_name
        if selectedProviders.contains(serviceVM.serviceList[indexPath.row].id) {
            cell.bgView.layer.borderColor = UIColor.black.cgColor
        } else {
            cell.bgView.layer.borderColor = UIColor.clear.cgColor
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = serviceVM.serviceList[indexPath.row].id
        if selectedProviders.contains(id) {
            selectedProviders.removeAll { res in
                res == id
            }
        } else {
            selectedProviders.append(id)
        }
        providerTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120 * appConstant.heightRatio
    }

}

