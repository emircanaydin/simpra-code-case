//
//  FriendListUseCase.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import RxSwift

class FriendListUseCase: SingleUseCase<FriendListRequest, FriendListResponse, FriendListRepositoryProtocol> {
    override func generateUseCase(parameter: FriendListRequest) -> Single<FriendListResponse>? {
        repository.getFriendList(request: parameter)
    }
}
