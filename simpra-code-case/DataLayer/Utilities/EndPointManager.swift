//
//  EndpointManager.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 19.10.2022.
//

import Foundation

typealias BaseUrls = EndpointManager.BaseUrl
typealias Paths = EndpointManager.Paths

enum EndpointManager {
    enum BaseUrl {
        case dev
        case test
        case qa
        case preprod
        case prod
        
        var description: String {
            switch self {
            case .dev, .test, .qa, .preprod, .prod:
                return "https://randomuser.me/api/"
            }
        }
    }
    
    enum Paths {
        var description: String {
            return ""
        }
    }
}
