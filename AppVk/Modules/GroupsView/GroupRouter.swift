//
//  GroupRouter.swift
//  AppVk
//
//  Created by Alexandr Gusev on 18.08.2022.
//

import Foundation

protocol GroupRouter: AnyObject {
    
    func goToInfoGroup(modelId: Int)
}

extension GroupsCoordinator: GroupRouter {
    
    func goToInfoGroup(modelId: Int){
        self.route(to: \.infoGroup, modelId)
    }
    
}
