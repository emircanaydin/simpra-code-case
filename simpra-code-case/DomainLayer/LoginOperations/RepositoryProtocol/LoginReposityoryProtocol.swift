//
//  LoginReposityoryProtocol.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RxSwift

protocol LoginReposityoryProtocol {
    func login(username: String, password: String) -> Single<LoginResponse>
}
