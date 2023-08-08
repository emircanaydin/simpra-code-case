//
//  LoginViewModel.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel: BaseViewModelDelegate {
    var dismissInformer: PublishSubject<Void>?
    var username: String = ""
    
    func login() {
        print("\(username)")
    }
}
