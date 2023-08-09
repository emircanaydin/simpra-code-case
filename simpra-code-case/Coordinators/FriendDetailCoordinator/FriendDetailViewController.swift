//
//  FriendDetailViewController.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import UIKit

class FriendDetailViewController: BaseViewController<FriendDetailViewModel> {
    private var friendDetailView: FriendDetailView!
    
    override func prepareViewControllerConfigurations() {
        addFriendDetail()
    }
    
    private func addFriendDetail() {
        friendDetailView = FriendDetailView()
        friendDetailView.setData(data: viewModel.getDetailViewData())
        self.view.addSubview(friendDetailView)
        
        friendDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
