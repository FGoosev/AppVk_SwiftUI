//
//  FriendsListView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 09.08.2022.
//

import SwiftUI

struct FriendsListView: View {
    
    @StateObject private var viewModel = FriendsListViewModel()
    var body: some View {
        ScrollView{
            header
            listFriends
        }
        .onAppear(perform: onApperSend)
        .padding()
            
    }
}

extension FriendsListView{
    
    var header: some View{
        SearchTextField(search: .constant(""))
    }
    
    var listFriends: some View{
        ForEach(viewModel.output.friends){ model in
            FriendCellView(model: model)
                .padding(.bottom, 10)
        }
    }
    
}

extension FriendsListView {
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
