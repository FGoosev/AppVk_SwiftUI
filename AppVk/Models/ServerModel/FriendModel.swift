//
//  FriendModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 09.08.2022.
//

import Foundation

struct FriendModel: Decodable {
    let id: Int
    let status: String?
    let track_code: String
    let first_name: String?
    let last_name: String?
    let can_access_closed: Bool?
    let is_closed: Bool?
}
