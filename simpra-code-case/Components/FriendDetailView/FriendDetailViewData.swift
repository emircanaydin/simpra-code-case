//
//  FriendDetailViewData.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

class FriendDetailViewData {
    private(set) var headerViewData: FriendDetailHeaderViewData
    private(set) var friendInfoViewData: FriendDetailInfoViewData
    
    init(headerViewData: FriendDetailHeaderViewData, friendInfoViewData: FriendDetailInfoViewData) {
        self.headerViewData = headerViewData
        self.friendInfoViewData = friendInfoViewData
    }
}
