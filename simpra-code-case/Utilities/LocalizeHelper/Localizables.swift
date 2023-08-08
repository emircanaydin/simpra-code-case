//
//  Localizables.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation

enum Localizables: String, GenericValueProtocol {
    typealias Value = String
    
    var value: String {
        return rawValue.toLocalize()
    }
    
    case brandName = "brand_name"
    case username = "username"
    case password = "password"
}

extension String {
    func toLocalize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
