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

extension BaseAPIService: GroupsListAPIProtocol, FriendsListAPIProtocol, PhotosListAPIProtocol, AlbumsListAPIProtocol  {
    
    func getFriends() -> AnyPublisher<[FriendModel], APIError> {
        provider.requestPublisher(.getFriends)
            .filterSuccessfulStatusCodes()
            .map(ServerResponse<ServerFriendResponse>.self)
            .map{$0.response.items}
            .map{FriendModelMapper().toLocal(list: $0)}
            .mapError({ _ in
                    .badQuery
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getGroups() -> AnyPublisher<[GroupModel], APIError>{
        provider.requestPublisher(.getGroups)
            .filterSuccessfulStatusCodes()
            .map(ServerResponse<ServerGroupsResponse>.self)
            .map{$0.response.items}
            .map{GroupModelMapper().toLocal(list: $0)}
            .mapError({ _ in
                    .badQuery
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getPhotos() -> AnyPublisher<[PhotoModel], APIError>{
        provider.requestPublisher(.getPhotos)
            .filterSuccessfulStatusCodes()
            .map(ServerResponse<ServerPhotoResponse>.self)
            .map{$0.response.items}
            .map{PhotoModelMapper().toLocal(list: $0)}
            .mapError({ _ in
                    .badQuery
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getGroupInfo() -> AnyPublisher<[GroupModel], APIError>{
        provider.requestPublisher(.getGroupInfo)
            .filterSuccessfulStatusCodes()
            .map(ServerResponse<[ServerGroupModel]>.self)
            .map{$0.response}
            .map{GroupModelMapper().toLocal(list: $0)}
            .mapError({ _ in
                    .badQuery
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getAlbums() -> AnyPublisher<[AlbumModel], APIError> {
        
        provider.requestPublisher(.getAlbums)
            .filterSuccessfulStatusCodes()
            .map(ServerResponse<ServerAlbumsResponse>.self)
            .map{$0.response.items}
            .map{AlbumModelMapper().toLocal(list: $0)}
            .mapError({ _ in
                .badQuery
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
         
    }
}


protocol GroupsListAPIProtocol{
    func getGroups() -> AnyPublisher<[GroupModel], APIError>
    func getGroupInfo() -> AnyPublisher<[GroupModel], APIError>
}

protocol PhotosListAPIProtocol{
    func getPhotos() -> AnyPublisher<[PhotoModel], APIError>
}

protocol AlbumsListAPIProtocol{
    func getAlbums() -> AnyPublisher<[AlbumModel], APIError>
}

protocol FriendsListAPIProtocol{
    func getFriends() -> AnyPublisher<[FriendModel], APIError>
}
