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
        self.view.backgroundColor = .green
        addFriendDetail()
    }
    
    private func addFriendDetail() {
        friendDetailView = FriendDetailView()
        friendDetailView.setData(data: FriendDetailViewData(headerViewData: FriendDetailHeaderViewData(imageContainerData: CustomImageViewComponentData(imageUrl: viewModel.friendData?.picture.large ?? "")), friendInfoViewData: FriendDetailInfoViewData(name: "Emircan Aydın", email: viewModel.friendData?.email ?? "", phone: viewModel.friendData?.phone ?? "", address: "Yenikent mah. Dicle Cad Gebze İzmit/Kocaeli")))
        self.view.addSubview(friendDetailView)
        
        friendDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
