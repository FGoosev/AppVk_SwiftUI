//
//  ServerGroupModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 12.08.2022.
//

import Foundation


struct ServerResponseGroup: Decodable {
    let response: ServerGroupResponse
}

struct ServerGroupResponse: Decodable {
    let count: Int
    let items: [ServerGroupModel]
}

struct ServerGroupModel: Decodable {
    let id: Int
    let description: String?
    let status: String?
    let name: String?
    let screenName: String?
    let isClosed: Int?
    let type: String?
    let photo50: String?
    let photo100: String?
    let photo200: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case description = "description"
        case status = "status"
        case name = "name"
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type = "type"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}
