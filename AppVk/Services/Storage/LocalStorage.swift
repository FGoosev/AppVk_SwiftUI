//
//  LocalStorage.swift
//  AppVk
//
//  Created by Alexandr Gusev on 07.08.2022.
//

import Foundation


enum LocalStorageKey: String {
    case token
    case vkId
    case expiresIn
    case status
    case groupId
    case albumId
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
    
    var expiresIn: String? {
        get {
            userDefaults.string(forKey: LocalStorageKey.expiresIn.rawValue)
        }
        
        set {
            userDefaults.set(newValue, forKey: LocalStorageKey.expiresIn.rawValue)
        }
    }
    
    var status: Bool? {
        
        get {
            userDefaults.bool(forKey: LocalStorageKey.status.rawValue)
        }
        
        set {
            userDefaults.set(newValue, forKey: LocalStorageKey.status.rawValue)
        }
        
    }
    
    var groupId: Int? {
        get {
            userDefaults.integer(forKey: LocalStorageKey.groupId.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: LocalStorageKey.groupId.rawValue)
        }
    }
    
    var albumId: Int? {
        get {
            userDefaults.integer(forKey: LocalStorageKey.albumId.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: LocalStorageKey.albumId.rawValue)
        }
    }
}
