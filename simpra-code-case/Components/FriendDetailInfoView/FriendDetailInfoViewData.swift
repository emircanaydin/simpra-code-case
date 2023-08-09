//
//  FriendDetailInfoViewData.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

class FriendDetailInfoViewData {
    private(set) var name: String
    private(set) var email: String
    private(set) var phone: String
    private(set) var address: String
    
    init(name: String, email: String, phone: String, address: String) {
        self.name = name
        self.email = email
        self.phone = phone
        self.address = address
    }
}
