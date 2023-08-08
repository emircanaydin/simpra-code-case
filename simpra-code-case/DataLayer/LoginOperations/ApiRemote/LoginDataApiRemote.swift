//
//  LoginDataApiRemote.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import RxSwift
import NetworkEntityLayer

class LoginDataApiRemote: BaseApiRemote<LoginServiceProviderManagerProtocol>, LoginDataRemoteProtocol {
    func login(username: String) -> Single<LoginResponse> {
        return Single.create { (single) -> Disposable in
            let response = AuthenticationManager.login(username: username)
            
            if response.isSuccess {
                single(.success(response))
            } else {
                single(.failure(ErrorResponse(serverResponse: ServerResponse(message: "User not found!", code: nil, status: nil), apiConnectionErrorType: .missingData(0))))
            }
            
            return Disposables.create()
        }
    }
}
