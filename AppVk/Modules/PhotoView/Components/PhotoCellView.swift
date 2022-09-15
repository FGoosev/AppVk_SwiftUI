//
//  PhotoCellView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 29.08.2022.
//

import SwiftUI
import Kingfisher

struct PhotoCellView: View {
    let model: PhotoModel
    @GestureState var isDetectingLongPress = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            photoCell
            infoPhoto
        }
    }
}


private extension PhotoCellView{
    
    var photoCell: some View {
        KFImage(URL(string: model.sizes[0].url ?? ""))
            .resizable()
            .cornerRadius(20)
            .frame(width: 150, height: 150)
            .scaledToFit()
    }
    
    var infoPhoto: some View {
        HStack{
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
            Text(String(model.likes.count ?? 0))
        }
        .padding(.leading, 10)
        .frame(width: 150,height: 20, alignment: .leading)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
}

struct PhotoCellView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCellView(model: .mock())
    }
}
