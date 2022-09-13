//
//  PhotosCoordinator.swift
//  AppVk
//
//  Created by Alexandr Gusev on 25.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class PhotosCoordinator: NavigationCoordinatable {
    
    let stack = NavigationStack(initial: \PhotosCoordinator.start)
    
    @Root var start = loadAlbumsView
    @Route(.push) var albumPhotos = makeAlbumPhotos
        
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
    
    @ViewBuilder func makeAlbumPhotos() -> some View {
        let viewModel = PhotoListViewModel(apiService: BaseAPIService())
        PhotoListView(viewModel: viewModel)
    }
}

