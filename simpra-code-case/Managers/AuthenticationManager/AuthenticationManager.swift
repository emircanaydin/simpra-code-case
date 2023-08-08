//
//  AuthenticationManager.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation

protocol AuthenticationManagerProtocol {
    
}

class AuthenticationManager: AuthenticationManagerProtocol {
    func checkLoginDataIsExists() -> Bool {
        DatabaseManager.shared.checkDataIsExists(key: DatabaseKeys.LoginUsernamesKey, type: SavedArray.self)
    }
}
