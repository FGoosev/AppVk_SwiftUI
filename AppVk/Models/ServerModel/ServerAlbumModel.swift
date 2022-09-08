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
    let privacyComment: ServerPrivacyComment?
    let privacyView: ServerPrivacyView?
    
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
        case privacyComment = "privacy_comment"
        case privacyView = "privacy_view"
        case thumbIsLast = "thumb_is_last"
    }
}

struct ServerPrivacyComment: Codable {
    let category: String?
    let owners: ServerOwners?
    let lists: ServerLists?
    
    enum CodingKeys: String, CodingKey {
        case category = "category"
        case owners = "owners"
        case lists = "lists"
    }
}

struct ServerOwners: Codable {
    let allowed: [String]?
    let excluded: [String]?
    
    enum CodingKeys: String, CodingKey {
        case allowed = "allowed"
        case excluded = "excluded"
    }
}

struct ServerLists: Codable {
    let allowed: [String]?
    let excluded: [String]?
    
    enum CodingKeys: String, CodingKey {
        case allowed = "allowed"
        case excluded = "excluded"
    }
}

struct ServerPrivacyView: Codable {
    let category: String?
    let owners: ServerOwners?
    let lists: ServerLists?
    
    enum CodingKeys: String, CodingKey {
        case category = "category"
        case owners = "owners"
        case lists = "lists"
    }
}


