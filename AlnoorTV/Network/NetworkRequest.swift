//
//  GetGitHubUsers.swift
//  AlnoorTV
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import Foundation

class NetworkRequest {
    
    func getGitHubUsersRequest(id: Int, completion: @escaping (Bool, Array<UserModel>?)-> ()) {
        
        let url:URL = URL(string: "https://api.github.com/users?since=\(id)")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) in
            do{
                let user = try JSONDecoder().decode(Array<UserModel>.self, from: data!)
                completion(false, user)
            } catch let error{
                print("Json Parse Error : \(error)")
                completion(true, nil)
            }
        }
        task.resume()
        
    }
    
    func getUserRepoRequest(userLogin: String, completion: @escaping (Bool, Array<RepoModel>?)-> ()) {
        
        let url:URL = URL(string: "https://api.github.com/users/\(userLogin)/repos")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) in
            do{
                let user = try JSONDecoder().decode(Array<RepoModel>.self, from: data!)
                completion(false, user)
            } catch let error{
                print("Json Parse Error : \(error)")
                completion(true, nil)
            }
        }
        task.resume()
        
    }
    
}
