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
            return "friends.get?v=5.131&access_token=vk1.a.Si3EvVfGmOAfAcngkYdfu-Id9IaV0UouDJ-_awto6DWi5zjv76J_fA1GAsuO73lbEBhXb6DfUBatrPehn54OHDMEQ0SmXXmAzlNEFZUY94e_dWPk8MMNuwfUId3XW6FOXwREbJdyQq8DbCrkIAJmfF5bQib8bcAOfbxFbyw5vQRzS1VnbinHoIsrbbxp2Jhu"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        [:]
    }
}
