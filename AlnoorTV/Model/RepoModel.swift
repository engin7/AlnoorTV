//
//  ReposModel.swift
//  AlnoorTV
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import Foundation

struct RepoModel: Decodable, Equatable {
    var description: String?
    var stargazers_count: Int?
    var language: String?
}
