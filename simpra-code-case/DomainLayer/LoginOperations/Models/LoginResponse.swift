//
//  LoginResponse.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation

enum LoginError {
    case userNotFound
    case userListNotFound
    case wrongPassword
}

struct LoginRequest {
    let username: String
    let password: String
}

struct LoginResponse {
    let isSuccess: Bool
    let username: String?
    let error: LoginError?
}
