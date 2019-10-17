//
//  BaseNetworkRequest.swift
//  AlnoorTV
//
//  Created by Onur Yıldırım on 17.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import Foundation
import UIKit

class BaseNetworkRequest {
    
    enum RequestType: String {
        case GET = "GET"
        case POST = "POST"
        case PUT = "PUT"
        case DELETE = "DELETE"
    }
    
    func getRequest(url: URL, type: RequestType, completion: @escaping(Data?)->()) {
        let session = URLSession.shared
        var request = URLRequest(url: url)
        
        request.httpMethod = type.rawValue
        
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) in
            guard error == nil && data != nil else {
                self.handleErrorCase(errorTextBody: "Probably internet connection error")
                return
            }
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
                self.handleErrorCase(errorTextBody: "HTTP status code error")
                return
            }
            completion(data)
        }
        task.resume()
    }
    
    func handleErrorCase(errorTextBody: String){
        let alert = UIAlertController(title: "Error",
                                      message: errorTextBody,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
}
