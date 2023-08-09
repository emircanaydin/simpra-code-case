//
//  BaseApiRemote.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 10.08.2023.
//

import Foundation
import NetworkLayer

public class BaseApiRemote<T> {
    private(set) var apiManager: ApiManagerProtocol
    private(set) var serviceProvider: T
    
    public init(apiManager: ApiManagerProtocol, serviceProvider: T) {
        self.apiManager = apiManager
        self.serviceProvider = serviceProvider
    }
}
