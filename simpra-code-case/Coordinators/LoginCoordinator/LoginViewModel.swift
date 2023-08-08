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

class LoginViewModel: BaseViewModelDelegate {
    var dismissInformer: PublishSubject<Void>?
    var username: String = ""
    
    private var loginCallback: LoginCallback
    private var loginUseCase: LoginUseCase
    
    init(loginCallback: LoginCallback, loginUseCase: LoginUseCase) {
        self.loginCallback = loginCallback
        self.loginUseCase = loginUseCase
    }
    
    private lazy var loginListener: (Result<LoginResponse, ErrorResponse>) -> Void = { [weak self] result in
        guard let self = self else { return }
        switch result {
        case .success(let response):
            print("\(response.username)")
        case .failure(let error):
            print("error")
        }
    }
    
    func login() {
        loginCallback.commonResult(completion: loginListener)
        loginUseCase.execute(useCaseCallBack: loginCallback, params: username)
    }
}
