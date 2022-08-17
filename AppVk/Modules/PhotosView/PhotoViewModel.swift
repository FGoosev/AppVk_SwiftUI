//
//  PhotoViewModel.swift
//  AppVk
//
//  Created by Alexandr Gusev on 17.08.2022.
//

import Foundation
import Combine

final class PhotoViewModel: ObservableObject {
    
    let apiService = BaseAPIService()
    
    let input = Input()
    @Published var output = Output()
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        bind()
    }
    
    func bind(){
        bindRequest()
    }
    
    func bindRequest(){
        
    }
}

extension PhotoViewModel {
    
    struct Input{
        let onAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output{
        
    }
    
}
