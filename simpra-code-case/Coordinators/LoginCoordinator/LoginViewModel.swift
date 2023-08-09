//
//  LoginViewModel.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RxSwift
import RxCocoa
import NetworkEntityLayer

typealias LoginStateBlock = (LoginState) -> Void

enum LoginState {
    case success
    case passwordRequired
    case usernameBlank
    case userNotFound
}

class LoginViewModel: BaseViewModelDelegate {
    var dismissInformer: PublishSubject<Void>?
    var username: String = ""
    
    private var loginState: LoginStateBlock?
    
    private var loginCallback: LoginCallback
    private var loginUseCase: LoginUseCase
    
    private var loginFinalize = BehaviorRelay<Bool>(value: false)
    
    init(loginCallback: LoginCallback, loginUseCase: LoginUseCase) {
        self.loginCallback = loginCallback
        self.loginUseCase = loginUseCase
    }
    
    private lazy var loginListener: (Result<LoginResponse, ErrorResponse>) -> Void = { [weak self] result in
        guard let self = self else { return }
        switch result {
        case .success(let response):
            self.loginState?(.success)
        case .failure(let error):
            self.loginState?(.userNotFound)
        }
    }
    
    func listenLoginState(with completion: @escaping LoginStateBlock) {
        loginState = completion
    }
    
    func login() {
        if username == "" {
            loginState?(.usernameBlank)
        }
        loginCallback.commonResult(completion: loginListener)
        loginUseCase.execute(useCaseCallBack: loginCallback, params: username)
    }
    
    func subscribeLoginProcess(completion: @escaping BooleanCompletionBlock) -> Disposable {
        loginFinalize.subscribe(onNext: completion)
    }
    
    func fireLoginProcessFinish() {
        DispatchQueue.main.async {
            self.loginFinalize.accept(true)
        }
    }
}
