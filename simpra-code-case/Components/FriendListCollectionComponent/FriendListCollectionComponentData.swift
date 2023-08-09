//
//  FriendListCollectionComponentData.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

class FriendListCollectionComponentData {
    private(set) var isRefreshingSupported: Bool = false

    init(isRefreshingSupported: Bool = false) {
        self.isRefreshingSupported = isRefreshingSupported
    }
}
