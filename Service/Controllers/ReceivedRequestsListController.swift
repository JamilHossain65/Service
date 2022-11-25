//
//  ReceivedRequestsListController.swift
//  Service
//
//  Created by Hamza on 03/10/2022.
//

import UIKit

class ReceivedRequestsListController: BaseController {
    
    lazy var requestTable = creatTable()
    lazy var nullLbl = Label(text: "No Data Found".localized, font: Font.medium(), color: theme_gray(), alignment: .center, numberOfLines: 1)

    var requestID = ""
    var requestVM = RequestsVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        nullLbl.isHidden = true
        childView.backgroundColor = viewController_color()
        requestTable.delegate = self
        requestTable.dataSource = self
        requestTable.register(ReceivedRequestTVCell.self, forCellReuseIdentifier: ReceivedRequestTVCell.cellidentifier)

        baseHeadingLbl.text = "Req " + requestID
        searchButtomView.isHidden = true
        showBackbtn(true)
        getData() 
    }
    
    private func setup() {
        childView.addSubview(requestTable)
        childView.addSubview(nullLbl)
        
        NSLayoutConstraint.activate([
            requestTable.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            requestTable.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            requestTable.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            requestTable.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -14 * appConstant.heightRatio),
            
            nullLbl.centerYAnchor.constraint(equalTo: childView.centerYAnchor),
            nullLbl.centerXAnchor.constraint(equalTo: childView.centerXAnchor),
        ])
    }
    
    func getData() {
        self.showProgres()
        let request = QutationsRequest(id: requestID)
        requestVM.getQutations(request: request) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.requestVM.qutationLIst.count == 0 ? (self.nullLbl.isHidden = false) : (self.nullLbl.isHidden = true)
            self.requestTable.reloadData()
        }
    }
    
    
}

extension ReceivedRequestsListController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        requestVM.qutationLIst.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReceivedRequestTVCell.cellidentifier, for: indexPath) as! ReceivedRequestTVCell
        cell.setupData(qutation: requestVM.qutationLIst[indexPath.row])
        cell.acceptBtn.tag = indexPath.row
        cell.rejectBtn.tag = indexPath.row
        cell.msgBtn.tag = indexPath.row
        cell.msgBtn.addTarget(self, action: #selector(chatBtnTapped), for: .touchUpInside)
        cell.acceptBtn.addTarget(self, action: #selector(acceptBtnTapped), for: .touchUpInside)
        cell.rejectBtn.addTarget(self, action: #selector(rejectBtnTapped), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        360 * appConstant.heightRatio
    }
    
    @objc func acceptBtnTapped(_ sender: UIButton) {
        self.showProgres()
        requestVM.acceptQutations(id:  requestVM.qutationLIst[sender.tag].id ?? 0) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.navigationController?.pushViewController(CheckoutController(), animated: true)
        }
        
    }
    
    @objc func rejectBtnTapped(_ sender: UIButton) {
        self.showProgres()
        requestVM.rejectQutations(id:  requestVM.qutationLIst[sender.tag].id ?? 0) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.getData()
        }
    }
    
    @objc func chatBtnTapped(_ sender: UIButton) {
        let vc = ChatController()
        vc.providerID = String(describing: requestVM.qutationLIst[sender.tag].providers_id)
        vc.providerName = requestVM.qutationLIst[sender.tag].provider_business_name.stringValue
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
