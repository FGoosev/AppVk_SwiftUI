//
//  GroupRouter.swift
//  AppVk
//
//  Created by Alexandr Gusev on 18.08.2022.
//

import Foundation

protocol GroupRouter: AnyObject {
    
    func goToInfoGroup()
    
}

extension GroupsCoordinator: GroupRouter {
    
    func goToInfoGroup(){
        self.route(to: \.infoGroup)
    }
}
