//
//  PhotoView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 17.08.2022.
//

import SwiftUI


struct AlbumsListView: View {
    
    @StateObject var viewModel: AlbumsListViewModel
    
    var body: some View {
        ScrollView{
            albumList
        }
        .onAppear(perform: onAppearSend)
    }
}

private extension AlbumsListView{
    func onAppearSend() {
        viewModel.input.onAppear.send()
    }
}

private extension AlbumsListView {
    var albumList: some View {
        ForEach(viewModel.output.albums){ model in
            AlbumCellView(model: model)
        }
    }
}

struct AlbumsListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumsListView(viewModel: AlbumsListViewModel(router: PhotosCoordinator(), api: BaseAPIService()))
    }
}
