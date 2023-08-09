//
//  ActionButtonData.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit

typealias VoidCompletionBlock = () -> Void

class ActionButtonData {
    private(set) var text: String
    private(set) var actionButtonListener: VoidCompletionBlock?
    
    init(text: String, actionButtonListener: VoidCompletionBlock? = nil) {
        self.text = text
        self.actionButtonListener = actionButtonListener
    }
    
    func setActionButtonListener(by value: VoidCompletionBlock?) {
        actionButtonListener = value
    }
}
