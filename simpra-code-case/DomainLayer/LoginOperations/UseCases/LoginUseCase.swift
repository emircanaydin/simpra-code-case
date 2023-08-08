//
//  LoginUseCase.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RxSwift

class LoginUseCase: SingleUseCase<String, LoginResponse, LoginReposityoryProtocol> {
    override func generateUseCase(parameter: String) -> Single<LoginResponse>? {
        repository.login(username: parameter)
    }
}
