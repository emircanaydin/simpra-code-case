//
//  ImageHelper.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit

enum Images: String, GenericValueProtocol {
    
    typealias Value = UIImage
    
    var value: UIImage {
        return UIImage(imageLiteralResourceName: rawValue)
    }
    
    case instagram = "instagram"
    case facebook = "facebook"
    case snapchat = "snapchat"
    case tiktok = "tiktok"
    case twitter = "twitter"
}
