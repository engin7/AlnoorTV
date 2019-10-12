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
    var avatar_url: String?
}
