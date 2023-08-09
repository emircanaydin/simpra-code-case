//
//  FriendListDataApiRemote.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import RxSwift

class FriendListDataApiRemote: BaseApiRemote<FriendListServiceProviderManagerProtocol>, FriendListDataApiRemoteProtocol {
    func getFriendList(request: FriendListRequest) -> Single<FriendListResponse> {
        apiManager.executeRequest(urlRequestConvertible: serviceProvider.getFriendListServiceProvider(requeset: request))
    }
}
