//
//  FriendContentDisplayerViewData.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

class FriendContentDisplayerViewData {
    private(set) var imageData: CustomImageViewComponentData
    private(set) var name: Name
    private(set) var email: String
    private(set) var phone: String
    private(set) var location: Location
    
    init(imageData: CustomImageViewComponentData, name: Name, email: String, phone: String, location: Location) {
        self.imageData = imageData
        self.name = name
        self.email = email
        self.phone = phone
        self.location = location
    }
}
