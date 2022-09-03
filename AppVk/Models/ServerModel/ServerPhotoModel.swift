//
//  ServerPhotoModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 17.08.2022.
//

import Foundation

struct ServerPhotoResponse: Codable {
    let count: Int
    let items: [ServerPhotoModel]
}

struct ServerPhotoModel: Codable{
    let albumID: Int?
    let date: Int?
    let id: Int?
    let ownerID: Int?
    let canComment: Int?
    let sizes: [Size]?
    let squareCrop: String?
    let text: String?
    let hasTags: Bool?
    let likes: Likes?
    let comments: Comments?
    let reposts: Comments?
    let tags: Comments?
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case canComment = "can_comment"
        case squareCrop = "square_crop"
        case sizes, text
        case hasTags = "has_tags"
        case likes, comments, reposts, tags
    }
}

struct Comments: Codable {
    let count: Int?
}


struct Likes: Codable {
    let count: Int?
    let userLikes: Int?
    
    enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
    }
}

struct Size: Codable {
    let height: Int?
    let url: String?
    let type: String?
    let width: Int?
}

