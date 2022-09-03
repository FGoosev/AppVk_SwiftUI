//
//  FriendsCoordinator.swift
//  AppVk
//
//  Created by Alexandr Gusev on 25.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class FriendsCoordinator: NavigationCoordinatable, FriendsRouter {
    
    let stack = NavigationStack(initial: \FriendsCoordinator.start)
    
    @Root var start = loadFriendsView
        
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

extension FriendsCoordinator{
    
    @ViewBuilder func loadFriendsView() -> some View {
        let viewModel = FriendsListViewModel(router: self, api: BaseAPIService())
        FriendsListView(viewModel: viewModel)
    }
}
