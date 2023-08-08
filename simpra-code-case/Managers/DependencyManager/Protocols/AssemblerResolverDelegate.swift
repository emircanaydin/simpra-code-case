//
//  AssemblerResolverDelegate.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import Swinject

protocol AssemblerResolverDelegate {
    
}

extension AssemblerResolverDelegate {
    func returnResolver() -> Resolver {
        return Assembler.sharedAssembler.resolver
    }
}
