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
        let data = list[index]
        return FriendContentDisplayerViewData(imageData: CustomImageViewComponentData(imageUrl: data.picture.thumbnail),
                                              name: data.name,
                                              email: data.email,
                                              phone: data.phone,
                                              location: data.location)
    }
    
    func getNumberOfSection() -> Int {
        1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return list.count > 0 ? list.count + 1 : 0
    }
    
    func getCount() -> Int {
        list.count
    }
    
    func refresh() {
        paginationInfo.page = 1
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
