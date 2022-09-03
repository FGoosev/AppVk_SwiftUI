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
    case getGroups
    case getPhotos
    case getGroupInfo
}


extension BaseAPI: TargetType {
    var baseURL: URL {
        URL(string: Consts.MethodVK.baseVkURL)!
    }
    
    var path: String {
        switch self {
        case .getFriends:
            return "method/friends.get"
            
        case .getGroups:
            return "method/groups.get"
            
        case .getPhotos:
            return "method/photos.get"
        
        case .getGroupInfo:
            return "method/groups.getById"
        }
    }
    
    
    var method: Moya.Method {
        .get
    }
    
    var getParameters: [String: Any] {
        switch self {
        case .getFriends:
            var param: [String: Any] = [:]
            param["v"] = "5.131"
            param["access_token"] = LocalStorage.current.token
            param["count"] = 100
            param["fields"] = "online, photo_50"
            
            return param
        case .getGroups:
            var param: [String: Any] = [:]
            param["v"] = "5.131"
            param["access_token"] = LocalStorage.current.token
            param["fields"] = "description,status"
            param["extended"] = 1
            
            return param
            
        case .getPhotos:
            var param: [String: Any] = [:]
            param["v"] = "5.131"
            param["access_token"] = LocalStorage.current.token
            param["extended"] = 1
            param["album_id"] = "profile"
            
            return param
            
        case .getGroupInfo:
            var param: [String: Any] = [:]
            param["v"] = "5.131"
            param["access_token"] = LocalStorage.current.token
            param["fields"] = "description"
            param["album_id"] = LocalStorage.current.groupId
            
            return param
        }
        
    }
    
    var task: Task {
        .requestParameters(parameters: getParameters, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        [:]
    }
}
