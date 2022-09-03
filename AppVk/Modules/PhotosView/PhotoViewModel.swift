//
//  PhotoViewModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 17.08.2022.
//

import Foundation
import Combine
import CombineExt

final class PhotoViewModel: ObservableObject {
    
    let apiService: PhotosListAPIProtocol
    
    let input = Input()
    @Published var output = Output()
    
    private weak var router: PhotosRouter?
    private var cancellable = Set<AnyCancellable>()
    
    init(router: PhotosRouter?, api: PhotosListAPIProtocol){
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
                self.apiService.getPhotos()
                    .materialize()
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink{ [weak self] in
                self?.output.photos = $0
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

extension PhotoViewModel {
    
    struct Input{
        let onAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output{
        var photos: [PhotoModel] = []
    }
    
}
