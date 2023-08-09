//
//  FriendDetailCoordinator.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import RxSwift

class FriendDetailCoordinator: BaseCoordinator<FriendDetailViewModel> {
    private let disposeBag = DisposeBag()
    
    override func start() {
        self.viewContoller = FriendDetailViewController(viewModel: viewModel)
        viewModel.subscribeDismissProcess(dismissListener)?.disposed(by: disposeBag)
    }
    
    func setupFriendData(by value: Friend) -> Self {
        viewModel.setupFriendData(with: value)
        return self
    }
    
    private lazy var dismissListener: OnDismissed = { [weak self] in
        guard let self = self else { return }
        self.parentCoordinator?.didFinish(coordinator: self)
    }
}
