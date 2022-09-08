//
//  GroupInfoViewModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 25.08.2022.
//

import Foundation
import Combine


final class GroupInfoViewModel: ObservableObject{
    
    let apiService: GroupsListAPIProtocol
    @Published var output: Output
    let input: Input
    
    private var cancellable = Set<AnyCancellable>()
    
    init(apiService: GroupsListAPIProtocol){
        self.apiService = apiService
        self.input = Input()
        self.output = Output()
        bind()
    }
    
    func bind(){
        bindRequestInfoGroup()
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

extension GroupInfoViewModel {
    
    struct Input {
        let makeInfoGroup = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var groupInfo: [GroupModel] = []
    }
}
