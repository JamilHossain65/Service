//
//  ChatVM.swift
//  Service
//
//  Created by Hamza on 04/11/2022.
//

import Foundation

class ChatVM {
    
    var chatList = [ChatListModel]()
    var userMessages = [UserMessageListModel]()
}

extension ChatVM {
    
    func getChatList( completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .getUserChatList) { (result: Result<ChatListRootModel>) in
            switch result {
            case .success(let value):
                guard let data = value.oData else { completion(nil); return }
                self.chatList = data
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func getUserMessages(completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .userMessageLIst) { (result: Result<UserMessageListRootModel?>) in
            switch result {
            case .success(let value):
                guard let data = value else { completion(nil); return }
                self.userMessages = data.oData ?? []
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func sendUserMessages(request: SendMessageRequest, completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .sendUserMessage(request)) { (result: Result<SendMessageResponse?>) in
            switch result {
            case .success(_):
                completion(nil)
            case .failure(let string):
                completion(string)
            }
        }
    }
    
}
