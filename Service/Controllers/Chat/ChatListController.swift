//
//  ChatListController.swift
//  Service
//
//  Created by Hamza on 29/09/2022.
//

import UIKit

class ChatListController: BaseController {
    
    lazy var chatTable = creatTable()
    lazy var nullLbl = Label(text: "No Data Found".localized, font: Font.medium(), color: theme_gray(), alignment: .center, numberOfLines: 1)
    
    var chatVM = ChatVM()
    var isFromMenu = false

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        isFromMenu ? showBackbtn(true) : showBackbtn(false)
        searchButtomView.isHidden = true
        childView.backgroundColor = viewController_color()
        chatTable.delegate = self
        chatTable.dataSource = self
        chatTable.register(ChatListTVCell.self, forCellReuseIdentifier: ChatListTVCell.cellidentifier)
        getData()
    }
    
    private func setup() {
        nullLbl.isHidden = true
        childView.addSubview(chatTable)
        childView.addSubview(nullLbl)
        
        NSLayoutConstraint.activate( [
            chatTable.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            chatTable.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            chatTable.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            chatTable.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -14 * appConstant.heightRatio),
            
            nullLbl.centerYAnchor.constraint(equalTo: childView.centerYAnchor),
            nullLbl.centerXAnchor.constraint(equalTo: childView.centerXAnchor),
        ])
    }

    func getData() {
        self.showProgres()
        chatVM.getChatList() { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.chatVM.chatList.count == 0 ? (self.nullLbl.isHidden = false) : (self.nullLbl.isHidden = true)
            self.chatTable.reloadData()
        }
    }
    
}

extension ChatListController: UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatVM.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatListTVCell.cellidentifier, for: indexPath) as! ChatListTVCell
        cell.setupData(chat: chatVM.chatList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120 * appConstant.heightRatio
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatController()
        vc.userData = chatVM.chatList[indexPath.row]
        vc.providerID = "\(chatVM.chatList[indexPath.row].provider_id)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
