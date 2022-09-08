//
//  PhotoViewModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 17.08.2022.
//

import Foundation
import Combine
import CombineExt

final class AlbumsListViewModel: ObservableObject {
    
    let apiService: AlbumsListAPIProtocol
    
    let input = Input()
    @Published var output = Output()
    
    private weak var router: PhotosRouter?
    private var cancellable = Set<AnyCancellable>()
    
    init(router: PhotosRouter?, api: AlbumsListAPIProtocol){
        self.router = router
        self.apiService = api
        bind()
    }
    
    func bind(){
        bindRequest()
    }
    
    func bindRequest(){
        let request = input.onAppear
            .map{ [unowned self] in
                self.apiService.getAlbums()
                    .materialize()
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink{ [weak self] in
                self?.output.albums = $0
            }
            .store(in: &cancellable)
        
        
        request
            .failures()
            .sink{
                switch $0 {
                case .badQuery: print("badQuery")
                case .notFound: print("notFound")
                }
            }
            .store(in: &cancellable)
    }
}

extension AlbumsListViewModel {
    
    struct Input{
        let onAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output{
        var albums: [AlbumModel] = []
    }
    
}
