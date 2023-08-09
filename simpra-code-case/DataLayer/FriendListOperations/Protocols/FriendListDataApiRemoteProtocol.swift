//
//  FriendListDataApiRemoteProtocol.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import RxSwift

protocol FriendListDataApiRemoteProtocol {
    func getFriendList(request: FriendListRequest) -> Single<FriendListResponse>
}
