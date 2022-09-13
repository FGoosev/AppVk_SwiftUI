//
//  ServerAlbumModel.swift
//  AppVk
//
//  Created by Александр Гусев on 05.09.2022.
//

import Foundation


struct ServerAlbumsResponse: Decodable {
    let count: Int
    let items: [ServerAlbumModel]
}

struct ServerAlbumModel: Decodable {
    let id: Int?
    let thumbId: Int?
    let ownerId: Int?
    let title: String?
    let description: String?
    let created: String?
    let updated: String?
    let size: Int?
    let canUpload: Int?
    let thumbSrc: String?
    let thumbIsLast: Int?
    let canDelete: Bool?
    let thumbSource: String?
 
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case thumbId = "thumb_id"
        case ownerId = "owner_id"
        case title = "title"
        case description = "description"
        case created = "created"
        case updated = "updated"
        case size = "size"
        case canUpload = "can_upload"
        case thumbSrc = "thumb_src"
        case thumbIsLast = "thumb_is_last"
        case canDelete = "can_delete"
        case thumbSource = "thumb_source"
    }
}

