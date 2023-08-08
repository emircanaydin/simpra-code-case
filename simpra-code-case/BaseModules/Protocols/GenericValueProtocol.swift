//
//  GenericValueProtocol.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation

protocol GenericValueProtocol {
    associatedtype Value
    var value: Value { get }
}
