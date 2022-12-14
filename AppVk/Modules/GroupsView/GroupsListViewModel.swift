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
    let apiService: GroupsListAPIProtocol
    private weak var router: GroupRouter?
    @Published var output = Output()
    let input: Input
    
    private var cancellable = Set<AnyCancellable>()
    
    init(router: GroupRouter, apiService: GroupsListAPIProtocol){
        self.router = router
        self.apiService = apiService
        self.input = Input()
        self.output = Output()
        
        setupBindings()
    }
    
    func setupBindings() {
        bindRequest()
        bindInfoGroup()
        bindRequestInfoGroup()
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
    
    func bindInfoGroup() {
        input.modelId.sink { value in
            self.router?.goToInfoGroup()
            LocalStorage.current.groupId = value
            print(value)
        }
        .store(in: &cancellable)
    }
    
    func bindRequestInfoGroup() {
        let request = input.makeInfoGroup
            .map{ [unowned self] in
                self.apiService.getGroupInfo()
                    .materialize()
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink{ [weak self] in
                self?.output.groupInfo = $0
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
        let modelId = PassthroughSubject<Int, Never>()
        let makeInfoGroup = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var groups: [GroupModel] = []
        var modelId: Int?
        var groupInfo: [GroupModel] = []
    }
}
