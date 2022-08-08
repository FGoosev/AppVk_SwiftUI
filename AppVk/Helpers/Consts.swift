//
//  Consts.swift
//  AppVk
//
//  Created by Alexandr Gusev on 07.08.2022.
//

import Foundation

struct Consts {
    
    struct BaseAPI {
        static let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    struct VK {
        static let vkURL = "https://oauth.vk.com/authorize"
        static let clientIDKey = "client_id"
        static let clientIDValue = "51396220"
        static let displayKey = "display"
        static let displayValue = "mobile"
        static let scopeKey = "scope"
        static let scopeValue = "12"
        static let responseTypeKey = "response_type"
        static let responseTypeValue = "token"
        static let redirectUriKey = "redirect_uri"
        static let redirectUriValue = "https://oauth.vk.com/blank.html"
    }
    
}
