//
//  GroupsCoordinator.swift
//  AppVk
//
//  Created by Alexandr Gusev on 18.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class GroupsCoordinator: NavigationCoordinatable{
    
    let stack = NavigationStack(initial: \GroupsCoordinator.start)
    
    @Root var start = loadGroupView
    @Route(.push) var infoGroup = makeInfoGroup
    
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
    
}

extension GroupsCoordinator {
    
    @ViewBuilder func loadGroupView() -> some View {
        let viewModel = GroupsListViewModel(router: self, apiService: BaseAPIService())
        GroupsListView(viewModel: viewModel)
    }
    
    @ViewBuilder func makeInfoGroup() -> some View {
        let viewModel = GroupInfoViewModel(apiService: BaseAPIService())
        GroupInfoView(viewModel: viewModel)
    }
    
}

