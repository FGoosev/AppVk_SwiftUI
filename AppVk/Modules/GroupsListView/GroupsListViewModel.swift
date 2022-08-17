//
//  GroupsListViewModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 12.08.2022.
//

import Foundation
import Combine
import CombineExt

final class GroupsListViewModel: ObservableObject{
    let apiService = BaseAPIService()
    
    @Published var output = Output()
    let input = Input()
    
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        setupBindings()
    }
    
    func setupBindings() {
        bindRequest()
    }
    
    func bindRequest() {
        
        let request = input.onAppear
            .map{ [unowned self] in
                self.apiService.getGroups()
                    .materialize()
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink{ [weak self] in
                self?.output.groups = $0
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

extension GroupsListViewModel {
    
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
        let onTap = PassthroughSubject<Int, Never>()
    }
    
    struct Output {
        var groups: [GroupModel] = []
    }
}
