//
//  FriendListViewModel.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import RxSwift

class FriendListViewModel: BaseViewModelDelegate {
    var dismissInformer: PublishSubject<Void>?
    
    private var friendListCallBack: FriendListCallBack
    private var friendListUseCase: FriendListUseCase
    
    init(friendListCallBack: FriendListCallBack, friendListUseCase: FriendListUseCase) {
        self.friendListCallBack = friendListCallBack
        self.friendListUseCase = friendListUseCase
    }
}
