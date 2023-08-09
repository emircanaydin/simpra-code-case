//
//  FriendListDataFormatterProtocol.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation

protocol FriendListDataFormatterProtocol {
    var paginationInfo: PaginationInfo { get set }
    func getRawData(at index: Int) -> Friend
    func getData(at index: Int) -> FriendContentDisplayerViewData?
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getCount() -> Int
    func refresh()
    func setData(with response: FriendListResponse)
    func setData(with list: [Friend])
}
