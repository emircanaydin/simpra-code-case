//
//  FriendDetailViewModel.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import RxSwift

class FriendDetailViewModel: BaseViewModelDelegate {
    var dismissInformer: PublishSubject<Void>?
    
    private var friendData: Friend?
    
    func setupFriendData(with value: Friend) {
        self.friendData = value
    }
}
