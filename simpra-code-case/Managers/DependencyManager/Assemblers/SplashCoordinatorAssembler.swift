//
//  SplashCoordinatorAssembler.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class SplashViewAssembler: Assembly {
    func assemble(container: Container) {
        container.autoregister(SplashCoordinator.self, initializer: SplashCoordinator.init).inObjectScope(.weak)
        container.autoregister(SplashScreenViewModel.self, initializer: SplashScreenViewModel.init).inObjectScope(.weak)
    }
}
