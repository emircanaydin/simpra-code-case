//
//  LoginCoordinator.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RxSwift

class LoginCoordinator: BaseCoordinator<LoginViewModel> {
    private let disposeBag = DisposeBag()
    
    override func start() {
        let loginViewController = LoginViewController(viewModel: viewModel)
        navigationController.viewControllers = [loginViewController]
    }
}
