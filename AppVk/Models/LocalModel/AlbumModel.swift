//
//  AlbumModel.swift
//  AppVk
//
//  Created by Александр Гусев on 05.09.2022.
//

import Foundation

struct AlbumModel: Identifiable {
    let id: Int
    let ownerId: Int
    let size: Int
    let title: String
    let created: String
    let description: String
    let canDelete: Bool
    let privacyComment: ServerPrivacy
    let privacyView: ServerPrivacy
    let thumbID: Int
    let thumbIsLast: Int
    let thumbSrc: String
    let updated: Int
}

extension AlbumModel {
    static func mock() -> Self {
        let serverOwnersLists: ServerOwnersLists = ServerOwnersLists(allowed: [], excluded: [])
        let serverPrivacy: ServerPrivacy = ServerPrivacy(category: "onle_me", lists: serverOwnersLists, owners: serverOwnersLists)
        
        return AlbumModel(id: 1,
                          ownerId: 1,
                          size: 1,
                          title: "title",
                          created: "created",
                          description: "description",
                          canDelete: false,
                          privacyComment: serverPrivacy,
                          privacyView: serverPrivacy,
                          thumbID: 1,
                          thumbIsLast: 1,
                          thumbSrc: "https://vk.com/images/camera_50.png",
                          updated: 1)
    }
}
