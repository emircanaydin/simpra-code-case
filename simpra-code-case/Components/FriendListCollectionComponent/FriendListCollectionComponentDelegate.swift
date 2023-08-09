//
//  FriendListCollectionComponentDelegate.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

protocol FriendListCollectionComponentDelegate: AnyObject {
    
    func getNumberOfSection() -> Int
    func getItemCount(in section: Int) -> Int
    func getData(at index: Int) -> FriendContentDisplayerViewData?
    func getMoreData()
    func isLoadingCell(for index: Int) -> Bool
    func selectedItem(at index: Int)
    func refreshCollectionView()
    
}

extension FriendListCollectionComponentDelegate {
    
    func refreshCollectionView() { }
    
}
