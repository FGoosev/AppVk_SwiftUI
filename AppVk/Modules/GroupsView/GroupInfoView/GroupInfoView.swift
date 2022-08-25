//
//  GroupInfoView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 25.08.2022.
//

import SwiftUI

struct GroupInfoView: View {
    
    @StateObject var viewModel: GroupInfoViewModel
    
    var body: some View {
        VStack{
            Text(String(viewModel.output.modelId))
        }
    }
}

struct GroupInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GroupInfoView(viewModel: GroupInfoViewModel(modelId: 0))
    }
}
