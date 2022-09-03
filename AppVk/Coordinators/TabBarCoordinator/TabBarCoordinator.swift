//
//  TabBarCoordinator.swift
//  AppVk
//
//  Created by Alexandr Gusev on 19.08.2022.
//

import Foundation
import SwiftUI
import Stinsen


final class TabBarCoordinator: TabCoordinatable {
    
    var child = TabChild(
        startingItems: [
             \TabBarCoordinator.groups,
             \TabBarCoordinator.friends,
              \TabBarCoordinator.photos,
        ]
    )
    
    @Route(tabItem: makeGroupsTab) var groups = makeGroups
    @Route(tabItem: makeFriendsTab) var friends = makeFriends
    @Route(tabItem: makePhotosTab) var photos = makePhotos
    
    deinit {
        print("Deinit TabBArCoordinator")
    }
}

extension TabBarCoordinator {
    
    func makeGroups() -> NavigationViewCoordinator<GroupsCoordinator> {
        NavigationViewCoordinator(GroupsCoordinator())
    }
    
    @ViewBuilder func makeGroupsTab(isActive: Bool) -> some View {
        Image(systemName: "rectangle.3.group")
        Text("Группы")
    }
    
    func makeFriends()  -> FriendsCoordinator {
        FriendsCoordinator()
    }
    
    @ViewBuilder func makeFriendsTab(isActive: Bool) -> some View {
        Image(systemName: "person.2")
        Text("Друзья")
    }
    
    func makePhotos() -> PhotosCoordinator {
        PhotosCoordinator()
    }
    
    @ViewBuilder func makePhotosTab(isActive: Bool) -> some View {
        Image(systemName: "photo.on.rectangle")
        Text("Фотографии")
    }
     
}
