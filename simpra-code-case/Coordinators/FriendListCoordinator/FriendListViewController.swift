//
//  FriendListViewController.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

class FriendListViewController: BaseViewController<FriendListViewModel> {
    private var friendListCollectionComponent: FriendListCollectionComponent!
    
    weak var router: FriendListRouter?
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        self.view.backgroundColor = Colors.lightGray.value
        addFriendListComponent()
        listenViewModelDataState()
        listenViewModelSelectedData()
        
        viewModel.getFriendList()
    }
    
    private func addFriendListComponent() {
        friendListCollectionComponent = FriendListCollectionComponent(data: FriendListCollectionComponentData(isRefreshingSupported: false))
        friendListCollectionComponent.setupDelegation(with: viewModel)
        
        view.addSubview(friendListCollectionComponent)
        
        friendListCollectionComponent.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func listenViewModelSelectedData() {
        viewModel.listenSelectedItem { [weak self] friend in
            self?.router?.pushDetail(with: friend)
        }
    }
    
    private func listenViewModelDataState() {
        viewModel.listenCollectionState { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .done:
                self.friendListCollectionComponent.reloadCollectionComponent()
            default:
                break
                
            }
        }
    }
}
