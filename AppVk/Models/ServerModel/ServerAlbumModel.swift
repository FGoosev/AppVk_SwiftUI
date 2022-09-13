//
//  ServerAlbumModel.swift
//  AppVk
//
//  Created by Александр Гусев on 05.09.2022.
//

import Foundation


struct ServerAlbumsResponse: Codable {
    let count: Int
    let items: [ServerAlbumModel]
}

struct ServerAlbumModel: Codable {
    let id: Int?
    let ownerId: Int?
    let size: Int?
    let title: String?
    let created: String?
    let description: String?
    let canDelete: Bool?
    let privacyComment: ServerPrivacy?
    let privacyView: ServerPrivacy?
    let thumbID: Int?
    let thumbIsLast: Int?
    let thumbSrc: String?
    let updated: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case ownerId = "owner_id"
        case size = "size"
        case title = "title"
        case created = "created"
        case description = "description"
        case canDelete = "can_delete"
        case privacyComment = "privacy_comment"
        case privacyView = "privacy_view"
        case thumbID = "thumb_id"
        case thumbIsLast = "thumb_is_last"
        case thumbSrc = "thumb_src"
        case updated = "updated"
    }
}

struct ServerPrivacy: Codable {
    let category: String?
    let lists: ServerOwnersLists?
    let owners: ServerOwnersLists?
    
    enum CodingKeys: String, CodingKey {
        case category = "category"
        case lists = "lists"
        case owners = "owners"
    }
}

struct ServerOwnersLists: Codable {
    let allowed: [Int]?
    let excluded: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case allowed = "allowed"
        case excluded = "excluded"
    }
}
