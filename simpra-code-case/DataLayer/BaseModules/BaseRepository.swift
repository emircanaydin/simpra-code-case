//
//  BaseRepository.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 10.08.2023.
//

import Foundation

public class BaseRepository<T> {
    private(set) public var apiRemote: T
    
    public init(apiRemote: T) {
        self.apiRemote = apiRemote
    }
}
