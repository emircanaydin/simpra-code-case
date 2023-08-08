//
//  AppViewModel.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RxSwift

class AppViewModel: BaseViewModelDelegate {
    var dismissInformer: PublishSubject<Void>?
}
