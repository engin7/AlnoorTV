//
//  GetGitHubUsers.swift
//  AlnoorTV
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import Foundation

class NetworkRequest: BaseNetworkRequest {
    
    func getGitHubUsersRequest(id: Int, completion: @escaping (Bool, Array<UserModel>?)-> ()) {
        
        let url:URL = URL(string: baseUrl + "?since=\(id)")!
        
        self.getRequest(url: url, type: .GET) { (data) in
            do{
                let user = try JSONDecoder().decode(Array<UserModel>.self, from: data!)
                completion(false, user)
            } catch let error{
                self.handleErrorCase(errorTextBody: "Json Parse Error : \(error)")
                completion(true, nil)
            }
        }
    }
    
    func getUserRepoRequest(userLogin: String, completion: @escaping (Bool, Array<RepoModel>?)-> ()) {
        let url:URL = URL(string: baseUrl + "/\(userLogin)/repos")!
        
        self.getRequest(url: url, type: .GET) { (data) in
            do{
                let user = try JSONDecoder().decode(Array<RepoModel>.self, from: data!)
                completion(false, user)
            } catch let error{
                self.handleErrorCase(errorTextBody: "Json Parse Error : \(error)")
                completion(true, nil)
            }
        }
    }
    
}
