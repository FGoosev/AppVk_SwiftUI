//
//  AlbumModelMapper.swift
//  AppVk
//
//  Created by Александр Гусев on 05.09.2022.
//

import Foundation

final class AlbumModelMapper: BaseModelMapper<ServerAlbumModel, AlbumModel> {
    override func toLocal(serverEntity: ServerAlbumModel) -> AlbumModel {
        AlbumModel(id: serverEntity.id ?? 0,
                   ownerId: serverEntity.ownerId ?? 0,
                   size: serverEntity.size ?? 0,
                   title: serverEntity.title.orEmpty,
                   created: serverEntity.created.orEmpty,
                   description: serverEntity.description.orEmpty,
                   canDelete: serverEntity.canDelete ?? false,
                   thumbID: serverEntity.thumbID ?? 0,
                   thumbIsLast: serverEntity.thumbIsLast ?? 0,
                   thumbSrc: serverEntity.thumbSrc.orEmpty,
                   updated: serverEntity.updated ?? 0)
    }
}
