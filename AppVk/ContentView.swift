//
//  ContentView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 07.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        if viewModel.token == nil {
            webView
        } else {
            FriendsListView()
        }
    }
}

private extension ContentView {
    @ViewBuilder var webView: some View{
        if let url = viewModel.url{
            WebViewRepresentable(url: url)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
