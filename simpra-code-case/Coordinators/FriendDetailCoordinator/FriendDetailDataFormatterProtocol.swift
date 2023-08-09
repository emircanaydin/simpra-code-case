//
//  FriendDetailDataFormatterProtocol.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

protocol FriendDetailDataFormatterProtocol {
    func getImageUrl() -> String
    func getName() -> String
    func getEmail() -> String
    func getPhone() -> String
    func getAddress() -> String
    func setData(with data: Friend)
}
