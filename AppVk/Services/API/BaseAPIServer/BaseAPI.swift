//
//  BaseAPI.swift
//  AppVk
//
//  Created by Alexandr Gusev on 07.08.2022.
//

import Foundation
import Moya

enum BaseAPI {
    case getFriends
}


extension BaseAPI: TargetType {
    var baseURL: URL {
        URL(string: Consts.MethodVK.baseVkURL)!
    }
    
    var path: String {
        switch self {
        case .getFriends:
            return "method/friends.get"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        var param: [String: Any] = [:]
        param["v"] = "5.131"
        param["access_token"] = LocalStorage.current.token
        param["count"] = 100
        param["fields"] = "online,photo_50"
        
        return .requestParameters(parameters: param, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        [:]
    }
}
