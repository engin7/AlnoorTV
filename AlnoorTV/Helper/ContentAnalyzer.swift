//
//  ContentAnalyzer.swift
//  AlnoorTV
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import Foundation

class ContentAnalyzer {
    
    func filterUsers(users: [UserModel], text: String) -> [Int] {
        var filterIndexes = [Int]()
        var index = 0
        for user in users {
            if(user.login!.contains(text) || text == ""){
                filterIndexes.append(index)
            }
            index += 1
        }
        return filterIndexes
    }
    
    func sortReposByRating(repos: [RepoModel]) -> [RepoModel] {
        var cacheRepos = repos
        cacheRepos = repos.sorted(by: { $0.stargazers_count! > $1.stargazers_count!})
        return cacheRepos
    }
}
