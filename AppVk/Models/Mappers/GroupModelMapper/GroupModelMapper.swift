//
//  GroupModelMapper.swift
//  AppVk
//
//  Created by Alexandr Gusev on 12.08.2022.
//

import Foundation


final class GroupModelMapper: BaseModelMapper<ServerGroupModel, GroupModel> {
    override func toLocal(serverEntity: ServerGroupModel) -> GroupModel {
        GroupModel(id: serverEntity.id,
                   description: serverEntity.description.orEmpty,
                   status: serverEntity.status.orEmpty,
                   name: serverEntity.name.orEmpty,
                   screenName: serverEntity.screenName.orEmpty,
                   isClosed: serverEntity.isClosed ?? 0,
                   type: serverEntity.type.orEmpty,
                   photo50: serverEntity.photo50.orEmpty,
                   photo100: serverEntity.photo100.orEmpty,
                   photo200: serverEntity.photo200.orEmpty)
    }
}
