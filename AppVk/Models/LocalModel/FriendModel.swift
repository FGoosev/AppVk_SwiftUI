//
//  FriendModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 09.08.2022.
//

import Foundation


struct FriendModel: Identifiable {
    let id: Int
    let online: Int
    let photo50: String
    let trackCode: String
    let firstName: String
    let lastName: String
    let canAccessClosed: Bool
    let isClosed: Bool
}

extension FriendModel {
    static func mock() -> Self {
        FriendModel(id: 1,
                    online: 1,
                    photo50: "https://vk.com/images/camera_50.png",
                    trackCode: "track_code",
                    firstName: "Alex",
                    lastName: "Noville",
                    canAccessClosed: false,
                    isClosed: false)
    }
}
