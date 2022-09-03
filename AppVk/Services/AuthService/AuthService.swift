//
//  AuthService.swift
//  AppVk
//
//  Created by Alexandr Gusev on 23.08.2022.
//

import Foundation
import Combine


struct AuthService {
    
    static var shared = AuthService()
    
    var status: CurrentValueSubject<Bool, Never>
    private init(){
        self.status = CurrentValueSubject<Bool, Never>(LocalStorage.current.status ?? false)
    }
    
}
