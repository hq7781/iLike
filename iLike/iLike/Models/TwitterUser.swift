//
//  TwitterUser.swift
//  iLike
//
//  Created by HongQuan on 2018/06/02.
//  Copyright © 2018年 Roan.Hong. All rights reserved.
//

import Foundation

struct TwitterUser: Codable {
    let id: String
    let name: String
    let screenName: String
    let profileImageURLString: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_str"
        case name
        case screenName = "screen_name"
        case profileImageURLString = "profile_image_url_https"
    }
}

extension TwitterUser {
    var profileImageURL: URL? {
        return URL(string: self.biggerProfileImageURLString)
    }
    
    private var biggerProfileImageURLString: String {
        return self.profileImageURLString.replacingOccurrences(of: "_normal.", with: "_bigger.", options: [.backwards])
    }
    
    init(_ user: EntityTwitterUser) {
        self.id = user.id
        self.name = user.name
        self.screenName = user.screenName
        self.profileImageURLString = user.imageURL
    }
}
