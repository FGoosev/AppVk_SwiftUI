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
    
    @ViewBuilder func sharedView(_ view: AnyView) -> some View {
        view
    }
    
    init(){
        stack = NavigationStack(initial: \MainCoordinator.main)
    }
    
}

extension MainCoordinator {
    
    func loadMain() -> NavigationViewCoordinator<ContentCoordinator>{
        let coordinator = ContentCoordinator()
        let stack = NavigationViewCoordinator(coordinator)
        return stack
    }
}
