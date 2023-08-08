//
//  LoginDataRepository.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import RxSwift

class LoginDataRepository: BaseRepository<LoginDataRemoteProtocol>, LoginReposityoryProtocol {
    func login(username: String) -> Single<LoginResponse> {
        apiRemote.login(username: username)
    }
}
