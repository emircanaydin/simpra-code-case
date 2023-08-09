//
//  NetworkAssembler.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import NetworkLayer
import Alamofire

class NetworkAssembler: Assembly {
    func assemble(container: Container) {
        container.autoregister(ApiManagerProtocol.self, initializer: ApiManager.init).inObjectScope(.container)
        container.autoregister(ApiInterceptor.self, initializer: ApiInterceptor.init).inObjectScope(.container)
        container.autoregister(RequestRetrier.self, initializer: ApiRetrier.init).inObjectScope(.container)
        container.autoregister(RequestAdapter.self, initializer: ApiAdapter.init).inObjectScope(.container)
        container.autoregister(ApiEventMonitor.self, initializer: ApiEventMonitor.init).inObjectScope(.container)
        container.autoregister(ApiManagerProtocol.self, initializer: ApiManager.init).inObjectScope(.container)
        container.autoregister(AccessProviderProtocol.self, initializer: AccessProviderManager.init).inObjectScope(.container)
    }
}
