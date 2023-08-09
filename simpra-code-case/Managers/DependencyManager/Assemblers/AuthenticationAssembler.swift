//
//  AuthenticationAssembler.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class AuthenticationAssembler: Assembly {
    func assemble(container: Container) {
        container.autoregister(LoginReposityoryProtocol.self, initializer: LoginDataRepository.init).inObjectScope(.weak)
        container.autoregister(LoginDataRemoteProtocol.self, initializer: LoginDataApiRemote.init).inObjectScope(.weak)
        container.autoregister(LoginServiceProviderManagerProtocol.self, initializer: LoginServiceProvider.init).inObjectScope(.weak)
    }
}
