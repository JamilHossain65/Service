//
//  URLSession.swift
//  Macmeter
//
//  Created by Muhammad Salman Zafar on 1/27/22.
//

import Foundation

extension URLSession {
    func dataTask(with request: MultipartFormDataRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
    -> URLSessionDataTask {
        return dataTask(with: request.asURLRequest(), completionHandler: completionHandler)
    }
}
