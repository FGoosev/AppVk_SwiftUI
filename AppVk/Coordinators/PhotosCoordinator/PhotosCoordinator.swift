//
//  PhotosCoordinator.swift
//  AppVk
//
//  Created by Alexandr Gusev on 25.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class PhotosCoordinator: NavigationCoordinatable, PhotosRouter {
    
    let stack = NavigationStack(initial: \PhotosCoordinator.start)
    
    @Root var start = loadAlbumsView
        
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

extension PhotosCoordinator{
    
    @ViewBuilder func loadAlbumsView() -> some View {
        let viewModel = AlbumsListViewModel(router: self, api: BaseAPIService())
        AlbumsListView(viewModel: viewModel)
    }
}

