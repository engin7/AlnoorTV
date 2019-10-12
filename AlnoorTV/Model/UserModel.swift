//
//  UserModel.swift
//  AlnoorTV
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import Foundation

struct UserModel: Decodable {
    var login: String?
    var id: Int
    var node_id: String?
    var avatar_url: String?
    var url: String?
    var html_url: String?
    var followers_url: String?
    var type: String?
    var repos_url: String?
    var site_admin: Bool
}
