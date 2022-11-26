//
//  RequestListController.swift
//  Service
//
//  Created by Hamza on 29/09/2022.
//

import UIKit
import WMSegmentControl

class RequestListController: BaseController {
    
    lazy var requestTable = creatTable()
    lazy var nullLbl = Label(text: "No Data Found".localized, font: Font.medium(), color: theme_gray(), alignment: .center, numberOfLines: 1)
    lazy var segment = WMSegment()

    var requestType: RequestType = .inProgress
    var requestVM = RequestsVM()
    var isFromMenu = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    
    private func initUI() {
        isFromMenu ? showBackbtn(true) : showBackbtn(false)
        nullLbl.isHidden = true
        setupSegmentControl()
        searchButtomView.isHidden = true
        childView.backgroundColor = viewController_color()
        requestTable.delegate = self
        requestTable.dataSource = self
        requestTable.register(RequestTVCell.self, forCellReuseIdentifier: RequestTVCell.cellidentifier)
        requestTable.register(CompletedTVCell.self, forCellReuseIdentifier: CompletedTVCell.cellidentifier)
        getData()
    }
    
    private func setup() {
        childView.addSubview(segment)
        childView.addSubview(requestTable)
        childView.addSubview(nullLbl)
        
        NSLayoutConstraint.activate( [
            segment.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            segment.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 16 * appConstant.widthRatio),
            segment.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -16 * appConstant.widthRatio),
            segment.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            requestTable.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            requestTable.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 12 * appConstant.heightRatio),
            requestTable.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            requestTable.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -14 * appConstant.heightRatio),
            
            nullLbl.centerYAnchor.constraint(equalTo: childView.centerYAnchor),
            nullLbl.centerXAnchor.constraint(equalTo: childView.centerXAnchor),
        ])
    }
    
    private func setupSegmentControl() {
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.type = .normal
        segment.selectorType = .normal
        segment.isRounded = true
        segment.buttonTitles = "In Progress,Completed"
        segment.textColor = unselected_color()
        segment.selectorTextColor = .black
        segment.selectorColor = theme_color()
        segment.SelectedFont = Font.semiBold()
        segment.normalFont = Font.regular()
        
        segment.onValueChanged = { index in
            if index == 0 {
                self.requestType = .inProgress
            } else {
                self.requestType = .complete
            }
            self.requestTable.reloadData()
        }
    }
    
    func getData() {
        self.showProgres()
        requestVM.getRequests() { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.requestTable.reloadData()
        }
    }
}

extension RequestListController: UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if requestType == .inProgress {
            self.requestVM.pendingList.count == 0 ? (self.nullLbl.isHidden = false) : (self.nullLbl.isHidden = true)
            return requestVM.pendingList.count
        } else {
            self.requestVM.completeList.count == 0 ? (self.nullLbl.isHidden = false) : (self.nullLbl.isHidden = true)
            return requestVM.completeList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        requestType == .inProgress ? inProgressCell(indexPath) : completeCell(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        403 * appConstant.heightRatio
    }
    
    private func inProgressCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = requestTable.dequeueReusableCell(withIdentifier: RequestTVCell.cellidentifier, for: indexPath) as! RequestTVCell
        cell.tag = indexPath.row
        cell.setupCellData(request: requestVM.pendingList[indexPath.row])
        cell.forwardBtn.addTarget(self, action: #selector(requestDetailbtntapped), for: .touchUpInside)
        return cell
    }
    
    private func completeCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = requestTable.dequeueReusableCell(withIdentifier: CompletedTVCell.cellidentifier, for: indexPath) as! CompletedTVCell
        cell.forwardBtn.addTarget(self, action: #selector(compeltebtntapped), for: .touchUpInside)
        return cell
    }
    
    @objc func requestDetailbtntapped(_ sender: UIButton) {
        let vc = ReceivedRequestsListController()
        vc.requestID = "\(requestVM.pendingList[sender.tag].id)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func compeltebtntapped() {
        self.navigationController?.pushViewController(TaskCompletedController(), animated: true)
    }
}
