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
                   thumbId: serverEntity.thumbId ?? 0,
                   ownerId: serverEntity.ownerId ?? 0,
                   title: serverEntity.title.orEmpty,
                   description: serverEntity.description.orEmpty,
                   created: serverEntity.created.orEmpty,
                   updated: serverEntity.updated.orEmpty,
                   size: serverEntity.size ?? 0,
                   canUpload: serverEntity.canUpload ?? 0,
                   thumbSrc: serverEntity.thumbSrc.orEmpty,
                   thumbIsLast: serverEntity.thumbIsLast ?? 0,
                   privacyComment: serverEntity.privacyComment ?? ServerPrivacyComment(category: "", owners: ServerOwners(allowed: [], excluded: []), lists: ServerLists(allowed: [], excluded: [])),
                   privacyView: serverEntity.privacyView ?? ServerPrivacyView(category: "", owners: ServerOwners(allowed: [], excluded: []), lists: ServerLists(allowed: [], excluded: []))
        )
    }
}
