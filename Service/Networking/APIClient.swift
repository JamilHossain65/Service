//
//  APIClient.swift
//  canva
//
//  Created by Muhammad Salman on 8/22/22.
//

import Foundation


struct APIClient {
    
    static let shared = APIClient()
    private init() { }
    
    func request<T: Decodable>(path: EndPoint, completion: @escaping (Result<T>) -> Void) {
        guard let request = path.urlRequest else {
            completion(.failure(Constant.Error.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                
                if let error = error {
                    print(error)
                    completion(.failure(error.localizedDescription))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(Constant.Error.noData))
                    return
                }
                
                #if DEBUG
                print(path.url?.absoluteString ?? "invalid url")
                print(String(data: data, encoding: .utf8) ?? "invalid json")
                #endif
                guard let httpResponse = response as? HTTPURLResponse, !(400...600).contains(httpResponse.statusCode) else {
                    let (err, obj) = JSONDecoder().decode(ErrorDetails.self, data: data)
                    if let err = err { completion(.failure(err)) }
                    else { completion(.failure(obj!.message)) }
                    return
                }
                
                let (err, obj) = try! JSONDecoder().decode(T.self, data: data)
                if let err = err { completion(.failure(err)) }
                else { completion(.success(obj!)) }
                
            }
        }.resume()
    }
    
    func uploadImage(imageData: Data, completion: @escaping (Result<UploadFileResponse>) -> Void) {
        let request = MultipartFormDataRequest(url: URL(string: API.baseUrl + EndPoint.uploadImage.path)!)
        request.addDataField(named: "file", data: imageData, mimeType: "img/jpeg")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                
                if let error = error {
                    completion(.failure(error.localizedDescription))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(Constant.Error.noData))
                    return
                }
                #if DEBUG
                print(String(data: data, encoding: .utf8) ?? "invalid json")
                #endif
                guard let httpResponse = response as? HTTPURLResponse, !(400...600).contains(httpResponse.statusCode) else {
                    
                    let (err, obj) = JSONDecoder().decode(ErrorDetails.self, data: data)
                    if let err = err { completion(.failure(err)) }
                    else { completion(.failure(obj!.message)) }
                    return
                }
                
                let (err, obj) = JSONDecoder().decode(UploadFileResponse.self, data: data)
                if let err = err { completion(.failure(err)) }
                else { completion(.success(obj!)) }
                
            }
        }.resume()
    }
    
    
    func requestWithMultiformData<T: Decodable>(request: MultipartFormDataRequest, completion: @escaping (Result<T>) -> Void) {

        URLSession.shared.dataTask(with: request.asURLRequest()) { data, response, error in
            DispatchQueue.main.async {
                
                if let error = error {
                    completion(.failure(error.localizedDescription))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(Constant.Error.noData))
                    return
                }
                #if DEBUG
                print(String(data: data, encoding: .utf8) ?? "invalid json")
                #endif
                guard let httpResponse = response as? HTTPURLResponse, !(400...600).contains(httpResponse.statusCode) else {
                    
                    let (err, obj) = JSONDecoder().decode(ErrorDetails.self, data: data)
                    if let err = err { completion(.failure(err)) }
                    else { completion(.failure(obj!.message)) }
                    return
                }
                
                let (err, obj) = JSONDecoder().decode(T.self, data: data)
                if let err = err { completion(.failure(err)) }
                else { completion(.success(obj!)) }
                
            }
        }.resume()
    }
    
}
