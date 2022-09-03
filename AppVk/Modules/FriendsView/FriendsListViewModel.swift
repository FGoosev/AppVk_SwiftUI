//
//  FriendsListViewModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 09.08.2022.
//

import Foundation
import Combine
import CombineExt



final class FriendsListViewModel: ObservableObject {
    
    let apiService: FriendsListAPIProtocol
    
    private weak var router: FriendsRouter?
    
    let input = Input()
    @Published var output = Output()
    
    private var cancellable = Set<AnyCancellable>()
    
    init(router: FriendsRouter?, api: FriendsListAPIProtocol) {
        self.router = router
        self.apiService = api
        setubBindings()
    }
    
    func setubBindings() {
        bindRequest()
    }
    
    func bindRequest() {
        
        let request = input.onAppear
            .map { [unowned self] in
                self.apiService.getFriends()
                    .materialize()
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink{ [weak self] in
                self?.output.friends = $0
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

extension FriendsListViewModel {
    
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var friends: [FriendModel] = []
    }
}
