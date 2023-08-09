//
//  UseCaseCallbackInteractor.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 10.08.2023.
//

import Foundation
import NetworkEntityLayer

public protocol UseCaseCallBackInterface {
    associatedtype Response
    
    var onSuccessCompletion: ((Response) -> Void)? { get }
    
    func onSuccess(response: Response)
    func onError(error: ErrorResponse)
    
    func onSuccess(completion: @escaping (Response) -> Void)
    func onError(completion: @escaping (ErrorResponse) -> Void)
    func commonResult(completion: @escaping (Result<Response, ErrorResponse>) -> Void)
}
