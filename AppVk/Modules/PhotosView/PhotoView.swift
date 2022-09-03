//
//  PhotoView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 17.08.2022.
//

import SwiftUI

struct PhotoView: View {
    
    @StateObject var viewModel: PhotoViewModel
    
    var body: some View {
        ScrollView{
            photosList
        }
        .onAppear(perform: onAppearSend)
    }
}

private extension PhotoView{
    func onAppearSend() {
        viewModel.input.onAppear.send()
    }
}

private extension PhotoView {
    var photosList: some View {
        ForEach(viewModel.output.photos){ model in
            Text(String(model.ownerID))
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(viewModel: PhotoViewModel(router: PhotosCoordinator(), api: BaseAPIService()))
    }
}
