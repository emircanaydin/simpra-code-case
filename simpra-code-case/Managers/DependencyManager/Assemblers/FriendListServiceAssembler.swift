//
//  FriendListServiceAssembler.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class FriendListServiceAssembler: Assembly {
    func assemble(container: Container) {
        container.autoregister(FriendListRepositoryProtocol.self, initializer: FriendListDataRepository.init).inObjectScope(.weak)
        container.autoregister(FriendListDataApiRemoteProtocol.self, initializer: FriendListDataApiRemote.init).inObjectScope(.weak)
        container.autoregister(FriendListServiceProviderManagerProtocol.self, initializer: FriendListServiceProviderManager.init).inObjectScope(.weak)
    }
}
