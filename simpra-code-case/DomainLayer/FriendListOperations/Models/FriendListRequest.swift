//
//  FriendListRequest.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

struct FriendListRequest: Codable {
    let page: Int
    var results: Int = 20
}
