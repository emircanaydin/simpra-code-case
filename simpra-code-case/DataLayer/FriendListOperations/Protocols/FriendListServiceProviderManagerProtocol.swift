//
//  FriendListServiceProviderManagerProtocol.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

protocol FriendListServiceProviderManagerProtocol {
    func getFriendListServiceProvider(requeset: FriendListRequest) -> FriendListServiceProvider
}
