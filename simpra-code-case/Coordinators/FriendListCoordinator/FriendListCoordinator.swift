//
//  FriendListCoordinator.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

class FriendListCoordinator: BaseCoordinator<FriendListViewModel> {
    override func start() {
        let friendListViewController = FriendListViewController(viewModel: viewModel)
        self.navigationController.viewControllers = [friendListViewController]
    }
}
