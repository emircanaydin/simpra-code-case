//
//  Colors.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit

enum Colors: GenericValueProtocol {
    typealias Value = UIColor
    
    var value: UIColor {
        switch self {
        case .simpraOrange:
            return #colorLiteral(red: 0.9411764706, green: 0.6901960784, blue: 0.3843137255, alpha: 1)
        case .paleGray:
            return #colorLiteral(red: 0.8274509804, green: 0.8274509804, blue: 0.8274509804, alpha: 1)
        case .defaultGray:
            return #colorLiteral(red: 0.2392156863, green: 0.2509803922, blue: 0.262745098, alpha: 1)
        case .defaultWhite:
            return #colorLiteral(red: 0.9707725644, green: 0.9807206988, blue: 0.9891527295, alpha: 1)
        }
    }
    
    case simpraOrange
    case paleGray
    case defaultGray
    case defaultWhite
}
