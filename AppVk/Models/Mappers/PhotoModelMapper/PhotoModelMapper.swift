//
//  PhotoModelMapper.swift
//  AppVk
//
//  Created by Alexandr Gusev on 29.08.2022.
//

import Foundation

final class PhotoModelMapper: BaseModelMapper<ServerPhotoModel, PhotoModel>{
    override func toLocal(serverEntity: ServerPhotoModel) -> PhotoModel {
        PhotoModel(albumID: serverEntity.albumID ?? 0,
                   date: serverEntity.date ?? 0,
                   id: serverEntity.id ?? 0,
                   ownerID: serverEntity.ownerID ?? 0,
                   canComment: serverEntity.canComment ?? 0,
                   sizes: serverEntity.sizes ?? [],
                   squareCrop: serverEntity.squareCrop.orEmpty,
                   text: serverEntity.text.orEmpty,
                   hasTags: serverEntity.hasTags ?? false,
                   likes: serverEntity.likes ?? Likes(count: 0, userLikes: 0),
                   comments: serverEntity.comments ?? Comments(count: 0),
                   reposts: serverEntity.reposts ?? Comments(count: 0),
                   tags: serverEntity.tags ?? Comments(count: 0))
    }
}
