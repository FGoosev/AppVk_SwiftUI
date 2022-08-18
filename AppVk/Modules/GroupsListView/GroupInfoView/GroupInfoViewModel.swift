//
//  GroupInfoViewModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 18.08.2022.
//

import Foundation
import Combine

final class GroupInfoViewModel: ObservableObject {
    
    let input: Input
    @Published var output: Output
    
    private var cancellable = Set<AnyCancellable>()
    
    init(phoneNumber: String) {
        self.input = Input()
        self.output = Output(phoneNumber: phoneNumber)
    }
    
    struct Input {
        
    }
    
    struct Output {
        let phoneNumber: String
    }
}
