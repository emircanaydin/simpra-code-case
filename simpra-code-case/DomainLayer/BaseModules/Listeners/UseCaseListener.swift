//
//  UseCaseListener.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 10.08.2023.
//

import Foundation

public protocol UseCaseListener: AnyObject {
    func onPreExecute()
    func onPostExecute()
}
