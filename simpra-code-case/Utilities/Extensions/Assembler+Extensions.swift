//
//  Assembler+Extensions.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import Swinject

extension Assembler {
    static let sharedAssembler: Assembler = {
        let container = Container()
        let assembler = Assembler([],
                                  container: container)
        return assembler
    }()
}
