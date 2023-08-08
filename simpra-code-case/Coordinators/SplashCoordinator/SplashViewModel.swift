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
        if !AuthenticationManager().checkLoginDataIsExists() {
            // I resorted to this approach because usernames were provided as mock data.
            let dataArray = ["9nd54", "v542w", "17pcy0", "gbf48", "zdah4"]
            let loginData = SavedArray()
            loginData.key = DatabaseKeys.LoginUsernamesKey
            loginData.data.append(objectsIn: dataArray)
            DatabaseManager.shared.addObject(loginData)
        }
        fireSplashProcessFinish()
    }
    
    func subscribeSplashProcess(completion: @escaping BooleanCompletionBlock) -> Disposable {
        return splashFinalize.subscribe(onNext: completion)
    }
    
    func fireSplashProcessFinish() {
        print("FİNİSH")
        splashFinalize.accept(true)
    }
}
