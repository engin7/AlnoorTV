//
//  ReposModel.swift
//  AlnoorTV
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import Foundation

struct RepoModel: Decodable {
    var id: Int?
    var node_id: String?
    var name: String?
    var full_name: String?
    var html_url: String?
    var description: String?
    var fork: Bool?
    var stargazers_count: Int?
    var language: String?
}
