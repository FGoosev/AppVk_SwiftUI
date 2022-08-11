//
//  Extensions+String.swift
//  AppVk
//
//  Created by Alexandr Gusev on 11.08.2022.
//

import Foundation


extension Optional where Wrapped == String {
    
    var orEmpty: String {
        guard let value = self else { return "" }
        return value
    }
}
