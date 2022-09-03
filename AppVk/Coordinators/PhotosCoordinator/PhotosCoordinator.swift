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
    
    @Root var start = loadPhotosView
        
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

extension PhotosCoordinator{
    
    @ViewBuilder func loadPhotosView() -> some View {
        let viewModel = PhotoViewModel(router: self, api: BaseAPIService())
        PhotoView(viewModel: viewModel)
    }
}

