//
//  FriendsListViewModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 09.08.2022.
//

import Foundation
import Combine


final class FriendsListViewModel: ObservableObject {
    
    let apiService = BaseApiService()
    
    var url: URL?{
        guard let urlComponents = URLComponents(string: Consts.MethodVK.baseVkURL) else {
            return nil
        }
        
        let items = [
            URLQueryItem(name: Consts.MethodVK.userIdKey, value: Consts.MethodVK.userIdValue),
            URLQueryItem(name: Consts.MethodVK.orderKey, value: Consts.MethodVK.orderValue),
            URLQueryItem(name: Consts.MethodVK.fieldsKey, value: Consts.MethodVK.fieldsValue),
            URLQueryItem(name: Consts.MethodVK.nameCaseKey, value: Consts.MethodVK.nameCaseValue)
        ]
        
        return urlComponents.url
    }
    
    let input = Input()
    @Published var output = Output()
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setubBindings()
    }
    
    func setubBindings() {
        bindRequest()
    }
    
    func bindRequest() {
        
        input.onAppear
            .map { [unowned self] in
                self.apiService.getFriends()
            }
            .switchToLatest()
            .sink { error in
                print(error)
            } receiveValue: { friend in
                print(friend)
            }
            .store(in: &cancellable)

    
    }
    
}

extension FriendsListViewModel {
    
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        
    }
}
