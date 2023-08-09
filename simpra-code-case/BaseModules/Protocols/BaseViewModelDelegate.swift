//
//  BaseViewModelDelegate.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RxSwift

public protocol BaseViewModelDelegate: AnyObject {
    var dismissInformer: PublishSubject<Void>? { get }
}

extension BaseViewModelDelegate {
    func dismissCoordinator() {
        dismissInformer?.onNext(())
    }
    
    func subscribeDismissProcess(_ completion: @escaping OnDismissed) -> Disposable? {
        return dismissInformer?.subscribe(onNext: completion)
    }
}
