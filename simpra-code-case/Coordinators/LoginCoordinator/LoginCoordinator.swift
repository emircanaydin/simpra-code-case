//
//  LoginCoordinator.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RxSwift
import RxCocoa

class LoginCoordinator: BaseCoordinator<LoginViewModel> {
    private let disposeBag = DisposeBag()
    
    private var loginFinalize = BehaviorRelay<Bool>(value: false)
    
    lazy var loginProccesCompletion: BooleanCompletionBlock = { [weak self] completed in
        if completed {
            self?.loginFinalize.accept(true)
            self?.dismissLoginCoordinator()
        }
    }
    
    override func start() {
        let loginViewController = LoginViewController(viewModel: viewModel)
        navigationController.viewControllers = [loginViewController]
        subscribeLoginProcess()
    }
    
    private func subscribeLoginProcess() {
        viewModel.subscribeLoginProcess(completion: loginProccesCompletion).disposed(by: disposeBag)
    }
    
    private func dismissLoginCoordinator() {
        parentCoordinator?.didFinish(coordinator: self)
    }
    
    func listenLoginCoordinatorFinishes(completion: @escaping BooleanCompletionBlock) -> Disposable {
        loginFinalize.subscribe(onNext: completion)
    }
}
