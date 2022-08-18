//
//  ContentCoordinator.swift
//  AppVk
//
//  Created by Alexandr Gusev on 18.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class ContentCoordinator: NavigationCoordinatable, LoginRouter {
    
    let stack = NavigationStack(initial: \ContentCoordinator.start)
    
    @Root var start = loadMainView
        
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

extension ContentCoordinator{
    
    @ViewBuilder func loadMainView() -> some View {
        let viewModel = ContentViewModel(router: self)
        ContentView(viewModel: viewModel)
    }
}
