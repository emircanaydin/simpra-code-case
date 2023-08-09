//
//  FriendListServiceProvider.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import NetworkLayer

class FriendListServiceProvider: ApiServiceProvider<FriendListRequest> {
    init(request: FriendListRequest) {
        super.init(baseUrl: BaseUrls.dev.description, method: .get, path: Paths.friendList(request).description, isAuthRequested: false, data: nil)
    }
}
