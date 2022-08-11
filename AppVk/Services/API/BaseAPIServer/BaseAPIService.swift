//
//  BaseAPIService.swift
//  AppVk
//
//  Created by Alexandr Gusev on 07.08.2022.
//

import Foundation
import Moya
import Combine
import CombineMoya

struct BaseApiService {
    let provider = Provider<BaseAPI>()
}

extension BaseApiService {
    
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
}
