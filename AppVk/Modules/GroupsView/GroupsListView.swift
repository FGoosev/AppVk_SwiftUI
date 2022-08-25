//
//  GroupsListView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 12.08.2022.
//

import SwiftUI

struct GroupsListView: View {
    @StateObject var viewModel:  GroupsListViewModel
    
    var body: some View {
        ScrollView{
            header
            groupsList
        }
        .onAppear(perform: onAppearSend)
    }
}

extension GroupsListView {
    
    var header: some View{
        SearchTextField(search: .constant(""))
    }
    
    var groupsList: some View {
        ForEach(viewModel.output.groups){ model in
            GroupCellView(model: model)
                .onTapGesture {
                    uploadModelId(id: model.id)
                }
                .padding(.bottom, 10)
        }
    }
}

extension GroupsListView {
    
    func onAppearSend(){
        viewModel.input.onAppear.send()
    }
    
    func uploadModelId(id: Int){
        viewModel.input.modelId.send(id)
    }
}

struct GroupsListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsListView(viewModel: GroupsListViewModel(router: GroupsCoordinator()))
    }
}
