//
//  SingleUseCase.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 10.08.2023.
//

import Foundation
import RxSwift
import NetworkEntityLayer

public class SingleUseCase<Request, Response, Repository>: BaseUseCase<Request, Single<Response>, Repository> {
    public func execute(useCaseCallBack: UseCaseCallBack<Response>, params: Request) {
        onPreExecute()
        addDisposable(disposable: self.generateUseCase(parameter: params)?.subscribe(onSuccess: { (response) in
            self.onPostExecute()
            useCaseCallBack.onSuccess(response: response)
        }, onFailure: { (error) in
            self.onPostExecute()
            self.onErrorCondition(useCaseCallBack: useCaseCallBack, error: error)
        }))
    }
    
    private func onErrorCondition(useCaseCallBack: UseCaseCallBack<Response>, error: Error) {
        guard let error = error as? ErrorResponse else { return }
        useCaseCallBack.onError(error: error)
    }
}
