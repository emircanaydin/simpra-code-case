//
//  FriendListDataFormatter.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

class FriendListDataFormatter: FriendListDataFormatterProtocol {
    var paginationInfo: PaginationInfo = PaginationInfo()
    private var data: FriendListResponse!
    private var list: [Friend] = [Friend]()
    
    func getRawData(at index: Int) -> Friend {
        list[index]
    }
    
    func getData(at index: Int) -> FriendContentDisplayerViewData? {
        guard index < list.count else { return nil }
        return FriendContentDisplayerViewData()
    }
    
    func getNumberOfSection() -> Int {
        1
    }
    
    func getNumbeOfItem(in section: Int) -> Int {
        list.count
    }
    
    func getCount() -> Int {
        list.count
    }
    
    func refresh() {
        paginationInfo.page = 0
        paginationInfo.refreshing = true
        list.removeAll()
    }
    
    func setData(with response: FriendListResponse) {
        self.data = response
        self.paginationInfo.refreshing = false
        self.list.append(contentsOf: response.results)
    }
    
    func setData(with list: [Friend]) {
        self.list = list
    }
}
