//
//  PhotoModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 29.08.2022.
//

import Foundation


struct PhotoModel: Identifiable {
    let albumID: Int
    let date: Int
    let id: Int
    let ownerID: Int
    let canComment: Int
    let sizes: [Size]
    let squareCrop: String
    let text: String
    let hasTags: Bool
    let likes: Likes
    let comments: Comments
    let reposts: Comments
    let tags: Comments
}

extension PhotoModel {
    
    static func mock() -> Self {
        let comment = Comments(count: 1)
        let likes = Likes(count: 1, userLikes: 1)
        let size1 = Size(height: 1,
                         url: "https://sun7.userapi.com/sun7-8/s/v1/ig2/3r8nwOMcXfK9x-QyakZCZBC7Is9hCu-ZeycmMYTm0oJMgSYDg_myTEA7z_MmcrF41xs64CACXQGSbzyn32qhgxfc.jpg?size=130x130&quality=96&type=album",
                         type: "type",
                         width: 1)
        let size2 = Size(height: 2,
                         url: "https://sun7.userapi.com/sun7-8/s/v1/ig2/3r8nwOMcXfK9x-QyakZCZBC7Is9hCu-ZeycmMYTm0oJMgSYDg_myTEA7z_MmcrF41xs64CACXQGSbzyn32qhgxfc.jpg?size=130x130&quality=96&type=album",
                         type: "type2",
                         width: 2)
        let sizes: [Size] = [size1, size2]
        return PhotoModel(albumID: 1,
                          date: 1,
                          id: 1,
                          ownerID: 1,
                          canComment: 1,
                          sizes: sizes,
                          squareCrop: "crop",
                          text: "text",
                          hasTags: true,
                          likes: likes,
                          comments: comment,
                          reposts: comment,
                          tags: comment)
    }
    
}
