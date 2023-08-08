//
//  CustomTextFieldData.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation

typealias TextChangeBlock = (String?) -> Void

class CustomTextFieldData {
    private(set) var placeHolder: String
    private(set) var textChangeListener: TextChangeBlock?
    
    init(placeHolder: String = "") {
        self.placeHolder = placeHolder
    }
    
    func setTextChangeListener(by value: @escaping TextChangeBlock) {
        textChangeListener = value
    }
}
