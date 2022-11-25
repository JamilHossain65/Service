//
//  ChatController.swift
//  Service
//
//  Created by Hamza on 08/10/2022.
//

import UIKit

class ChatController: BaseController {
    
    lazy var bottomView = View(backgroundColor: .black)
    lazy var chatTxtView = TextFieldwithButtonView()
    lazy var chatTable = creatTable()
    
    var userData: ChatListModel?
    let chatVM = ChatVM()
    var providerID = ""
    var providerName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
 
    private func initUI() {
        if let provider = providerName {
            baseHeadingLbl.text =  provider
        } else {
            baseHeadingLbl.text =  (userData?.provider?.first_name ?? "") + " " +  (userData?.provider?.last_name ?? "")
        }
        
        chatTxtView.placeholder = "Type Something"
        searchButtomView.isHidden = true
        showBackbtn(true)
        chatTable.delegate = self
        chatTable.dataSource = self
        chatTable.register(ChatLeftTextTVCell.self, forCellReuseIdentifier: ChatLeftTextTVCell.cellidentifier)
        chatTable.register(ChatRightTVCell.self, forCellReuseIdentifier: ChatRightTVCell.cellidentifier)
        chatTable.register(ChatMediaTVCell.self, forCellReuseIdentifier: ChatMediaTVCell.cellidentifier)
        chatTxtView.sendBtn.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        getMessages()
    }
    
    private func setup() {
        childView.addSubview(bottomView)
        bottomView.addSubview(chatTxtView)
        childView.addSubview(chatTable)
        
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: childView.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 110 * appConstant.heightRatio),
            
            chatTxtView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            chatTxtView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            chatTxtView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            chatTxtView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            chatTable.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            chatTable.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            chatTable.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            chatTable.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
        ])
    }
    
    func getMessages() {
        self.showProgres()
        chatVM.getUserMessages() { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.chatTable.reloadData()
            if self.chatVM.userMessages.count > 0 {
                self.chatTable.scrollToRow(at: IndexPath(item: self.chatVM.userMessages.count - 1, section: 0), at: .bottom, animated: true)
            }
        }
    }
    
    @objc func sendMessage() {
        self.showProgres()
        let request = SendMessageRequest(provider_id: providerID, message: chatTxtView.txtField.text.stringValue)
        chatVM.sendUserMessages(request: request) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.getMessages()
        }
    }
    
}

extension ChatController: UITableViewDelegate,UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatVM.userMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if chatVM.userMessages[indexPath.row].sender != "Provider" {
            return rightCell(indexPath)
        } else {
            return leftCell(indexPath)
        }
    }
    
    private func leftCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTable.dequeueReusableCell(withIdentifier: ChatLeftTextTVCell.cellidentifier, for: indexPath) as! ChatLeftTextTVCell
        cell.msgLbl.text = chatVM.userMessages[indexPath.row].message
        cell.timeLbl.text = (chatVM.userMessages[indexPath.row].created_at ?? "").convertIntoDate
        return cell
    }
    
    private func rightCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTable.dequeueReusableCell(withIdentifier: ChatRightTVCell.cellidentifier, for: indexPath) as! ChatRightTVCell
        cell.msgLbl.text = chatVM.userMessages[indexPath.row].message
        cell.timeLbl.text = chatVM.userMessages[indexPath.row].created_at?.convertIntoDate
        return cell
    }
}
