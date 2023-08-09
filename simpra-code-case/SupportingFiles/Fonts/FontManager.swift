//
//  FontManager.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit

enum FontManager: GenericValueProtocol {
    typealias Value = UIFont
    
    case robotoMedium(CGFloat)
    case robotoBold(CGFloat)
    case robotoRegular(CGFloat)
    case robotoBoldItalic(CGFloat)
    
    var value: UIFont {
        switch self {
        case .robotoMedium(let size):
            return UIFont(name: "Roboto-Medium", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
        case .robotoBold(let size):
            return UIFont(name: "Roboto-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
        case .robotoRegular(let size):
            return UIFont(name: "Roboto-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
        case .robotoBoldItalic(let size):
            return UIFont(name: "Roboto-BoldItalic", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
        }
    }
}
