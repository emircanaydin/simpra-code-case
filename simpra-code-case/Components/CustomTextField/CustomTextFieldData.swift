//
//  CustomTextFieldData.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation

typealias TextChangeBlock = (String?) -> Void

class CustomTextFieldData {
    private(set) var textChangeListener: TextChangeBlock?
    
    init(textChangeListener: TextChangeBlock? = nil) {
        self.textChangeListener = textChangeListener
    }
}
