//
//  LoginDataApiRemote.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import RxSwift
import NetworkEntityLayer

class LoginDataApiRemote: BaseApiRemote<LoginServiceProviderManagerProtocol>, LoginDataRemoteProtocol {
    func login(username: String, password: String) -> Single<LoginResponse> {
        return Single.create { (single) -> Disposable in
            let response = AuthenticationManager.login(username: username, password: password)
            single(.success(response))
            return Disposables.create()
        }
    }
}
