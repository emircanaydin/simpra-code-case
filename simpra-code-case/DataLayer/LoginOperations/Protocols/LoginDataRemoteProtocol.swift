//
//  LoginDataRemoteProtocol.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RxSwift

protocol LoginDataRemoteProtocol {
    func login(username: String) -> Single<LoginResponse>
}
