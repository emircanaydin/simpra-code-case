//
//  FriendListCoordinatorAssembler.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class FriendListCoordinatorAssembler: Assembly {
    func assemble(container: Container) {
        container.autoregister(FriendListViewModel.self, initializer: FriendListViewModel.init).inObjectScope(.weak)
        container.autoregister(FriendListCoordinator.self, initializer: FriendListCoordinator.init).inObjectScope(.weak)
        
        container.autoregister(FriendListUseCase.self, initializer: FriendListUseCase.init).inObjectScope(.transient)
        container.autoregister(FriendListCallBack.self, initializer: FriendListCallBack.init).inObjectScope(.transient)
    }
}
