//
//  GroupInfoViewModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 25.08.2022.
//

import Foundation
import Combine
import CombineExt


final class PhotoListViewModel: ObservableObject{
    
    let apiService: PhotosListAPIProtocol
    @Published var output: Output
    let input: Input
    
    private var cancellable = Set<AnyCancellable>()
    
    init(apiService: PhotosListAPIProtocol){
        self.apiService = apiService
        self.input = Input()
        self.output = Output()
        bind()
    }
    
    func bind(){
        bindRequestMakeAlbumPhotos()
    }
    
    func bindRequestMakeAlbumPhotos() {
        let request = input.makePhotos
            .map{ [unowned self] in
                self.apiService.getPhotos()
                    .materialize()
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink{ [weak self] in
                self?.output.albumPhotos = $0
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

extension PhotoListViewModel {
    
    struct Input {
        let makePhotos = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var albumPhotos: [PhotoModel] = []
    }
}
