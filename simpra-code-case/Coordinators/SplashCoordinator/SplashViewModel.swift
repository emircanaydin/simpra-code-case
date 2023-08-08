//
//  SplashViewModel.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RxCocoa
import RxSwift

typealias BooleanCompletionBlock = (Bool) -> Void

class SplashScreenViewModel: BaseViewModelDelegate {
    var dismissInformer: PublishSubject<Void>?

    private var splashFinalize = BehaviorRelay<Bool>(value: false)
    
    /// Description: This module could be used to get app configuration files,
    /// app initialize process or application session management etc
    func startSplashProcess() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.fireSplashProcessFinish()
        }
    }
    
    func subscribeSplashProcess(completion: @escaping BooleanCompletionBlock) -> Disposable {
        return splashFinalize.subscribe(onNext: completion)
    }
    
    func fireSplashProcessFinish() {
        splashFinalize.accept(true)
    }
}
