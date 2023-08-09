//
//  FriendListViewModel.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import RxSwift
import NetworkEntityLayer

typealias CollectionLoadingStateBlock = (CollectionLoadingState) -> Void
typealias CollectionSelectedItemBlock = (Int) -> Void

class FriendListViewModel: BaseViewModelDelegate {
    var dismissInformer: PublishSubject<Void>?
    
    private var collectionState: CollectionLoadingStateBlock?
    private var selectedItemBlock: CollectionSelectedItemBlock?
    
    private var friendListCallBack: FriendListCallBack
    private var friendListUseCase: FriendListUseCase
    private var dataFormatter: FriendListDataFormatterProtocol
    
    init(friendListCallBack: FriendListCallBack, friendListUseCase: FriendListUseCase, dataFormatter: FriendListDataFormatterProtocol) {
        self.friendListCallBack = friendListCallBack
        self.friendListUseCase = friendListUseCase
        self.dataFormatter = dataFormatter
    }
    
    func getFriendList() {
        friendListCallBack.commonResult(completion: friendListResponseListener)
        friendListUseCase.execute(useCaseCallBack: friendListCallBack, params: FriendListRequest(page: dataFormatter.paginationInfo.nextPage()))
        
    }
    
    func listenCollectionState(with completion: @escaping CollectionLoadingStateBlock) {
        collectionState = completion
    }
    
    
    
    private lazy var friendListResponseListener: (Result<FriendListResponse, ErrorResponse>) -> Void = { [weak self ] result in
        guard let self = self else { return }
        self.dataFormatter.paginationInfo.fetching = false
        
        switch result {
        case .failure(let error):
            print("error")
        case .success(let response):
            // TODO: Set data
            self.collectionState?(.done)
        }
    }
}
