//
//  SplashCoordinator.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RxSwift
import RxCocoa

class SplashCoordinator: BaseCoordinator<SplashScreenViewModel> {
    private let disposeBag = DisposeBag()
    
    private var splashFinalize = BehaviorRelay<Bool>(value: false)
    
    lazy var splashProcessCompletion: BooleanCompletionBlock = { [weak self] completed in
        if completed {
            self?.splashFinalize.accept(true)
            self?.dismissSplashCoordinator()
        }
    }
    
    override func start() {
        let viewController = SplashViewController(viewModel: viewModel)
        self.viewContoller = viewController
        subscribeSplashProcess()
    }
    
    private func subscribeSplashProcess() {
        viewModel.subscribeSplashProcess(completion: splashProcessCompletion).disposed(by: disposeBag)
    }
    
    private func dismissSplashCoordinator() {
        parentCoordinator?.didFinish(coordinator: self)
    }
    
    func listenSplahCoordinatorFinishes(completion: @escaping BooleanCompletionBlock) -> Disposable {
        return splashFinalize.subscribe(onNext: completion)
    }
}
