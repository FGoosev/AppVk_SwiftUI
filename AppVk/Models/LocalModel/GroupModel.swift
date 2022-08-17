//
//  GroupModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 12.08.2022.
//

import Foundation


struct GroupModel: Identifiable {
    let id: Int
    let description: String
    let status: String
    let name: String
    let screenName: String
    let isClosed: Int
    let type: String
    let photo50: String
    let photo100: String
    let photo200: String
}

extension GroupModel {
    static func mock() -> Self {
        GroupModel(id: 1,
                   description: "description",
                   status: "status",
                   name: "name",
                   screenName: "screenName",
                   isClosed: 0,
                   type: "type",
                   photo50: "https://sun7.userapi.com/sun7-8/s/v1/ig2/sGAdySZTUXHN-pvjrzj854VyDawXHJ5oXt2Ec6OerYPuh8PcjVd_kPGK-aPS7aJlDGxW5riaQXEUbFtbcd8tYRok.jpg?size=50x50&quality=95&crop=477,529,853,853&ava=1",
                   photo100: "photo100",
                   photo200: "photo200"
        )
    }
}
