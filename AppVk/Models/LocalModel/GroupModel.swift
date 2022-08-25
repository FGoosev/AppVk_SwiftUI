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
                   photo100: "https://sun7.userapi.com/sun7-8/s/v1/ig2/D36S6eR0usmMxmlNr3wa5WFrcyWY1vSwcoz0WyHmESBY30VpKcTSofFh75Fj7GzLsoOZO9774BLUKdF07eIH1zAb.jpg?size=100x100&quality=95&crop=0,0,2560,2560&ava=1",
                   photo200: "https://sun7.userapi.com/sun7-8/s/v1/if1/dKq0uiBRU8xh3Hp85r7zrfBu_Af0Iq7_FDr9w4g9X5NnzWDsYOqcno3uLNVr5EWhT7eyjrdU.jpg?size=200x200&quality=96&crop=0,0,1024,1024&ava=1"
        )
    }
}
