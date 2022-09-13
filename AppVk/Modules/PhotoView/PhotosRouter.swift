//
//  PhotosRouter.swift
//  AppVk
//
//  Created by Alexandr Gusev on 25.08.2022.
//

import Foundation


protocol PhotosRouter: AnyObject {
    
    func goToAlbumPhotos()
    
}

extension PhotosCoordinator: PhotosRouter {
    
    func goToAlbumPhotos() {
        self.route(to: \.albumPhotos)
    }
    
}
