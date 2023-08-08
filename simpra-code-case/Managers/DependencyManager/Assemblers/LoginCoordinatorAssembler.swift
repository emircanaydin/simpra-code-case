//
//  LoginCoordinatorAssembler.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class LoginCoordinatorAssembler: Assembly {
    func assemble(container: Container) {
        container.autoregister(LoginCoordinator.self, initializer: LoginCoordinator.init).inObjectScope(.weak)
        container.autoregister(LoginViewModel.self, initializer: LoginViewModel.init).inObjectScope(.weak)
    }
}
