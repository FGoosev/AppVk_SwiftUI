//
//  PhotoCellView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 29.08.2022.
//

import SwiftUI

struct PhotoCellView: View {
    let model: PhotoModel
    
    
    var body: some View {
        VStack{
            photoList()
        }
    }
}

extension PhotoCellView{
    @ViewBuilder func photoList() -> some View {
        VStack{
            
            Image(uiImage: model.sizes[0].url?.load() ?? UIImage())
                .clipShape(Circle())
        }
    }
}

struct PhotoCellView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCellView(model: .mock())
    }
}
