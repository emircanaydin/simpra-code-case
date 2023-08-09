//
//  CustomImageViewComponentData.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import UIKit

class CustomImageViewComponentData {
    private(set) var imageUrl: String
    private(set) var contentMode: UIView.ContentMode = .scaleAspectFill
    private(set) var loadingType: CustomImageLoadingType = .memory
    private(set) var imageId: String?
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
    
    func setContentMode(by value: UIView.ContentMode) -> Self {
        self.contentMode = value
        return self
    }
    
    func setLoadingType(by value: CustomImageLoadingType) -> Self {
        self.loadingType = value
        return self
    }
    
    func setImageId(by value: String) -> Self {
        self.imageId = value
        return self
    }
}
