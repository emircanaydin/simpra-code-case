//
//  FriendContentDisplayerCollectionViewCell.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import UIKit

class FriendContentDisplayerCollectionViewCell: GenericCollectionViewCell<FriendContentDisplayerViewData, FriendContentDisplayerView> {
    override func setupView() {
        super.setupView()
        setViewConfigurations()
    }
    
    func setViewConfigurations() {
        backgroundColor = .white
        contentView.backgroundColor = .white
    }
}
