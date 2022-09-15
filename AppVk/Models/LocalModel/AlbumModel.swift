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
    let thumbID: Int
    let thumbIsLast: Int
    let thumbSrc: String
    let updated: Int
}

extension AlbumModel {
    static func mock() -> Self {
        return AlbumModel(id: 1,
                          ownerId: 1,
                          size: 1,
                          title: "title",
                          created: "created",
                          description: "description",
                          canDelete: false,
                          thumbID: 1,
                          thumbIsLast: 1,
                          thumbSrc: "https://vk.com/images/camera_50.png",
                          updated: 1)
    }
}
