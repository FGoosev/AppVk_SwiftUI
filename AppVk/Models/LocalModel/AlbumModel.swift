//
//  AlbumModel.swift
//  AppVk
//
//  Created by Александр Гусев on 05.09.2022.
//

import Foundation

struct AlbumModel: Identifiable {
    let id: Int
    let thumbId: Int
    let ownerId: Int
    let title: String
    let description: String
    let created: String
    let updated: String
    let size: Int
    let canUpload: Int
    let thumbSrc: String
    let thumbIsLast: Int
    let privacyComment: ServerPrivacyComment
    let privacyView: ServerPrivacyView
}

extension AlbumModel {
    static func mock() -> Self {
        
        
        let owners = ServerOwners(allowed: [], excluded: [])
        let lists = ServerLists(allowed: [], excluded: [])
        let privacyComment = ServerPrivacyComment(category: "category", owners: owners, lists: lists)
        let privacyView = ServerPrivacyView(category: "category", owners: owners, lists: lists)
         
        return AlbumModel(id: 1,
                   thumbId: 1,
                   ownerId: 1,
                   title: "title",
                   description: "description",
                   created: "08.08.2022",
                   updated: "08.08.2022",
                   size: 5,
                   canUpload: 1,
                   thumbSrc: "https://sun7.userapi.com/sun7-8/s/v1/ig2/3r8nwOMcXfK9x-QyakZCZBC7Is9hCu-ZeycmMYTm0oJMgSYDg_myTEA7z_MmcrF41xs64CACXQGSbzyn32qhgxfc.jpg?size=130x130&quality=96&type=album",
                   thumbIsLast: 1,
                   privacyComment: privacyComment,
                   privacyView: privacyView
        )
    }
}
