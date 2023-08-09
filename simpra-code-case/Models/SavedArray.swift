//
//  SavedArray.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RealmSwift

class SavedArray: Object {
    @objc dynamic var key: String = ""
    let data = List<String>()

    override static func primaryKey() -> String? {
        return "key"
    }
}
