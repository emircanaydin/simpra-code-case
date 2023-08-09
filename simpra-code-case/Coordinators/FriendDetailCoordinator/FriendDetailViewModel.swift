//
//  FriendDetailViewModel.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import Foundation
import RxSwift

class FriendDetailViewModel: BaseViewModelDelegate {
    var dismissInformer: PublishSubject<Void>?
    
    var friendData: Friend!
    private let dataFormatter: FriendDetailDataFormatterProtocol
    
    init(dataFormatter: FriendDetailDataFormatterProtocol) {
        self.dataFormatter = dataFormatter
    }
    
    func setupFriendData(with value: Friend) {
        self.friendData = value
        dataFormatter.setData(with: friendData)
    }
    
    func getDetailViewData() -> FriendDetailViewData {
        let headerViewData = FriendDetailHeaderViewData(imageContainerData: CustomImageViewComponentData(imageUrl: dataFormatter.getImageUrl()))
        let friendInfoViewData = FriendDetailInfoViewData(name: dataFormatter.getName(), email: dataFormatter.getEmail(), phone: dataFormatter.getPhone(), address: dataFormatter.getAddress())
        return FriendDetailViewData(headerViewData: headerViewData,
                                    friendInfoViewData: friendInfoViewData)
    }
}
