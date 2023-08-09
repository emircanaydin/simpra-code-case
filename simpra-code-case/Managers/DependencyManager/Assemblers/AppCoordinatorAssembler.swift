//
//  AppCoordinatorAssembler.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class AppCoordinatorAssembler: Assembly {
    func assemble(container: Container) {
        container.autoregister(AppCoordinator.self, initializer: AppCoordinator.init).inObjectScope(.container)
        container.autoregister(AppViewModel.self, initializer: AppViewModel.init).inObjectScope(.container)
    }
}
