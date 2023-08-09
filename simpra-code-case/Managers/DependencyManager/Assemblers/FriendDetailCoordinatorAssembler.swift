//
//  FriendDetailCoordinatorAssembler.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class FriendDetailCoordinatorAssembler: Assembly {
    func assemble(container: Container) {
        container.autoregister(FriendDetailCoordinator.self, initializer: FriendDetailCoordinator.init).inObjectScope(.weak)
        container.autoregister(FriendDetailViewModel.self, initializer: FriendDetailViewModel.init).inObjectScope(.weak)
    }
}
