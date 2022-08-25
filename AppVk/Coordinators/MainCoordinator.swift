//
//  MainCoordinator.swift
//  AppVk
//
//  Created by Alexandr Gusev on 18.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class MainCoordinator: NavigationCoordinatable {
    
    
    var stack: NavigationStack<MainCoordinator>
    
    @Root var main = loadMain
    @Root var tabBar = makeTabBar
    
    init(){
        if AuthService.shared.status.value {
            stack = NavigationStack(initial: \MainCoordinator.tabBar)
        } else {
            stack = NavigationStack(initial: \MainCoordinator.main)
        }
    }
    
    @ViewBuilder func customize(_ view: AnyView) -> some View {
        view
            .onReceive(AuthService.shared.status) { status in
                if status {
                    self.root(\.tabBar)
                } else {
                    self.root(\.main)
                }
            }
    }
    
}

extension MainCoordinator {
    
    func loadMain() -> NavigationViewCoordinator<ContentCoordinator>{
        let coordinator = ContentCoordinator()
        let stack = NavigationViewCoordinator(coordinator)
        return stack
    }
    
    func makeTabBar() -> TabBarCoordinator {
        TabBarCoordinator()
    }
}
