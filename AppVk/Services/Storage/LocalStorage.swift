//
//  LocalStorage.swift
//  AppVk
//
//  Created by Alexandr Gusev on 07.08.2022.
//

import Foundation
import ReactiveSwift


enum LocalStorageKey: String {
    case token
    case vkId
}

struct LocalStorage {
    
    private let userDefaults = UserDefaults.standard
    
    static var current = LocalStorage()
    
    private init(){}
    
    var vkId: Int? {
        
        get {
            userDefaults.integer(forKey: LocalStorageKey.vkId.rawValue)
        }
        
        set{
            userDefaults.set(newValue, forKey: LocalStorageKey.vkId.rawValue)
        }
    }
    
    var token: String? {
        
        get {
            userDefaults.string(forKey: LocalStorageKey.token.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: LocalStorageKey.token.rawValue)
        }
    }
}
