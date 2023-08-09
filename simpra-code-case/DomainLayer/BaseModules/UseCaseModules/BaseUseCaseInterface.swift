//
//  BaseUseCaseInterface.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 10.08.2023.
//

import Foundation

protocol BaseUseCaseInterface {
    var useCaseListener: UseCaseListener? { get }
    
    associatedtype Parameters
    associatedtype Responses
    
    func generateUseCase(parameter: Parameters) -> Responses?
    
    func onPreExecute()
    func onPostExecute()
}
