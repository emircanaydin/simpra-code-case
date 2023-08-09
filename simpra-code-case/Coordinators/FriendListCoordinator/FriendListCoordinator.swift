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
        friendListViewController.router = self
        self.navigationController.viewControllers = [friendListViewController]
    }
    
    private func forwardFriendDetail(with data: Friend) {
        guard let coordinator = assemblerResolver.resolve(FriendDetailCoordinator.self) else { return }
        start(coordinator: coordinator.setupFriendData(by: data))
        self.navigationController.pushViewController(coordinator.viewContoller, animated: true)
    }
}

extension FriendListCoordinator: FriendListRouter {
    func pushDetail(with data: Friend) {
        forwardFriendDetail(with: data)
    }
}
