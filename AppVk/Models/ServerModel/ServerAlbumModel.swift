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
        case thumbID = "thumb_id"
        case thumbIsLast = "thumb_is_last"
        case thumbSrc = "thumb_src"
        case updated = "updated"
    }
}

