//
//  PaginationInfo.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

struct PaginationInfo {
    var page: Int = 0
    var fetching: Bool = false
    var refreshing: Bool = false
    
    mutating func nextPage() -> Int {
        fetching = true
        return page + 1
    }
}
