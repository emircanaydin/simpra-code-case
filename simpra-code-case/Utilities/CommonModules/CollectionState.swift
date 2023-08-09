//
//  CollectionState.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

enum CollectionLoadingState {
    case loading
    case done
    case reloadIndex(IndexPath)
}
