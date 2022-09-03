//
//  GroupInfoViewModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 25.08.2022.
//

import Foundation
import Combine


final class GroupInfoViewModel: ObservableObject{
    @Published var output: Output
    let input: Input
    
    private var cancellable = Set<AnyCancellable>()
    
    init(modelId: Int){
        self.input = Input()
        self.output = Output(modelId: modelId)
    }
}

extension GroupInfoViewModel {
    
    struct Input {
        
    }
    
    struct Output {
        let modelId: Int
    }
}
