//
//  FriendDetailHeaderView.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import UIKit

class FriendDetailHeaderView: GenericBaseView<FriendDetailHeaderViewData> {
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 6
        temp.clipsToBounds = true
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(imageContainer)
        
        imageContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        imageContainer.setData(data: data.imageContainerData)
    }
}
