//
//  LoginUseCase.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RxSwift

class LoginUseCase: SingleUseCase<LoginRequest, LoginResponse, LoginReposityoryProtocol> {
    override func generateUseCase(parameter: LoginRequest) -> Single<LoginResponse>? {
        repository.login(username: parameter.username, password: parameter.password)
    }
}
