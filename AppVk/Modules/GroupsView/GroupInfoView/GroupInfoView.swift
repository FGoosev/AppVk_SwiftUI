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
        ScrollView{
            findGroup
        }
        .onAppear(perform: onAppearSend)
    }
}

private extension GroupInfoView {
    func onAppearSend(){
        viewModel.input.makeInfoGroup.send()
    }
}

private extension GroupInfoView {
    var findGroup: some View {
        ForEach(viewModel.output.groupInfo){ model in
            GroupInfoCellView(model: model)
        }
    }
}

struct GroupInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GroupInfoView(viewModel: GroupInfoViewModel(apiService: BaseAPIService()))
    }
}
