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
        friendListUseCase.execute(useCaseCallBack: friendListCallBack, params: FriendListRequest(page: dataFormatter.paginationInfo.page))
    }
    
    func listenCollectionState(with completion: @escaping CollectionLoadingStateBlock) {
        collectionState = completion
    }
    
    func refreshData(with externalRefresh: Bool = false) {
        dataFormatter.refresh()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.getFriendList()
        }
    }
    
    private lazy var friendListResponseListener: (Result<FriendListResponse, ErrorResponse>) -> Void = { [weak self ] result in
        guard let self = self else { return }
        self.dataFormatter.paginationInfo.fetching = false
        
        switch result {
        case .failure(let error):
            print("error")
        case .success(let response):
            self.dataFormatter.setData(with: response)
            self.collectionState?(.done)
        }
    }
}

extension FriendListViewModel: FriendListCollectionComponentDelegate {
    func getNumberOfSection() -> Int {
        dataFormatter.getNumberOfSection()
    }
    
    func getItemCount(in section: Int) -> Int {
        dataFormatter.getNumberOfItem(in: section)
    }
    
    func getData(at index: Int) -> FriendContentDisplayerViewData? {
        dataFormatter.getData(at: index)
    }
    
    func getMoreData() {
        dataFormatter.paginationInfo.nextPage()
        getFriendList()
    }
    
    func isLoadingCell(for index: Int) -> Bool {
        index >= dataFormatter.getCount() && dataFormatter.getCount() != 0
    }
    
    func selectedItem(at index: Int) {
        selectedItemBlock?(index)
    }
    
    func refreshCollectionView() {
        refreshData()
    }
}
