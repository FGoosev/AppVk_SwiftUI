//
//  ContentView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 07.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ContentViewModel
    var body: some View {
        if !AuthService.shared.status.value{
            webView
        }
    }
}

private extension ContentView {
    @ViewBuilder var webView: some View{
        if let url = viewModel.url{
            WebViewRepresentable(url: url, onComplited: viewModel.input.onComplitedWebView)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(router: ContentCoordinator()))
    }
}
