//
//  FriendsListView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 09.08.2022.
//

import SwiftUI

struct FriendsListView: View {
    
    @StateObject var viewModel = FriendsListViewModel()
    
    var body: some View {
        Text("Click me!")
            .onAppear(perform: onApperSend)
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
