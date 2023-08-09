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
    class func checkLoginDataIsExists() -> Bool {
        DatabaseManager.shared.checkDataIsExists(key: DatabaseKeys.LoginUsernamesKey, type: SavedArray.self)
    }
    
    class func login(username: String) -> LoginResponse {
        guard let usersObject = DatabaseManager.shared.getObject(SavedArray.self, key: DatabaseKeys.LoginUsernamesKey) else {
            return LoginResponse(isSuccess: false, username: nil, error: .userListNotFound)
        }
        
        guard let user = usersObject.data.filter({ $0 == username }).first else {
            return LoginResponse(isSuccess: false, username: nil, error: .userNotFound)
        }
        
        return LoginResponse(isSuccess: true, username: user, error: nil)
    }
}
