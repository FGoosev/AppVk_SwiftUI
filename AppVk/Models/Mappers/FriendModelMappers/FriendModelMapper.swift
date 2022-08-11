//
//  FriendModelMapper.swift
//  AppVk
//
//  Created by Alexandr Gusev on 11.08.2022.
//

import Foundation

final class FriendModelMapper: BaseModelMapper<ServerFriendModel, FriendModel> {
    override func toLocal(serverEntity: ServerFriendModel) -> FriendModel {
        FriendModel(id: serverEntity.id,
                    online: serverEntity.online ?? 0,
                    photo50: serverEntity.photo50.orEmpty,
                    trackCode: serverEntity.trackCode.orEmpty,
                    firstName: serverEntity.firstName.orEmpty,
                    lastName: serverEntity.lastName.orEmpty,
                    canAccessClosed: serverEntity.canAccessClosed ?? false,
                    isClosed: serverEntity.isClosed ?? false)
    }
}
