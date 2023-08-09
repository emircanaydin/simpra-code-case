//
//  FriendDetailDataFormatter.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

class FriendDetailDataFormatter: FriendDetailDataFormatterProtocol {
    private var data: Friend!
    
    func getImageUrl() -> String {
        data.picture.large
    }
    
    func getName() -> String {
        "\(data.name.first) \(data.name.last)"
    }
    
    func getEmail() -> String {
        data.email
    }
    
    func getPhone() -> String {
        data.phone
    }
    
    func getAddress() -> String {
        "\(data.location.street.number) \(data.location.street.name) \(data.location.state) \(data.location.city)/\(data.location.country)"
    }
    
    func setData(with data: Friend) {
        self.data = data
    }
}
