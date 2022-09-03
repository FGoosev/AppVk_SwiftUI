//
//  FriendModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 09.08.2022.
//

import Foundation

struct ServerResponse<Content: Decodable>: Decodable {
    let response: Content
}

struct ServerFriendResponse: Decodable {
    let count: Int
    let items: [ServerFriendModel]
}

struct ServerFriendModel: Decodable {
    let id: Int
    let online: Int?
    let photo50: String?
    let trackCode: String?
    let firstName: String?
    let lastName: String?
    let canAccessClosed: Bool?
    let isClosed: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case online = "online"
        case photo50 = "photo_50"
        case trackCode = "track_code"
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
    }
}
