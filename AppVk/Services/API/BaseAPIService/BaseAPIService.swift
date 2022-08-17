//
//  FriendsAPIService.swift
//  AppVk
//
//  Created by Alexandr Gusev on 12.08.2022.
//

import Foundation
import Moya
import Combine
import CombineMoya

struct BaseAPIService {
    let provider = Provider<BaseAPI>()
}

extension BaseAPIService {
    
    func getFriends() -> AnyPublisher<[FriendModel], APIError> {
        provider.requestPublisher(.getFriends)
            .filterSuccessfulStatusCodes()
            .map(ServerResponse.self)
            .map{$0.response.items}
            .map{FriendModelMapper().toLocal(list: $0)}
            .mapError({ _ in
                    .badQuery
            })
            .eraseToAnyPublisher()
    }
    
    func getGroups() -> AnyPublisher<[GroupModel], APIError>{
        provider.requestPublisher(.getGroups)
            .filterSuccessfulStatusCodes()
            .map(ServerResponseGroup.self)
            .map{$0.response.items}
            .map{GroupModelMapper().toLocal(list: $0)}
            .mapError({ _ in
                    .badQuery
            })
            .eraseToAnyPublisher()
    }
}
