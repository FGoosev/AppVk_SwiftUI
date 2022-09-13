//
//  PhotoListView.swift
//  AppVk
//
//  Created by Александр Гусев on 11.09.2022.
//

import SwiftUI

struct PhotoListView: View {
    
    @StateObject var viewModel: PhotoListViewModel
    @GestureState var isDetectingLongPress = false
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        ScrollView {
            gridPhoto
        }
        .onAppear(perform: makePhotos)
    }
}

private extension PhotoListView {
    var gridPhoto: some View {
        VStack{
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(viewModel.output.albumPhotos){ model in
                    PhotoCellView(model: model)
                }
            }
        }
    }
}

private extension PhotoListView {
    
    func makePhotos() {
        viewModel.input.makePhotos.send()
    }
    
}

struct PhotoListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView(viewModel: PhotoListViewModel(apiService: BaseAPIService()))
    }
}
