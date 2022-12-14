//
//  AlbumCellView.swift
//  AppVk
//
//  Created by Александр Гусев on 08.09.2022.
//

import SwiftUI
import Kingfisher

struct AlbumCellView: View {
    let model : AlbumModel
    var body: some View {
        ZStack(alignment: .bottom){
            KFImage(URL(string: model.thumbSrc))
                .resizable()
                .cornerRadius(20)
                .frame(width: 250, height: 250)
                .scaledToFit()
            VStack(alignment: .leading){
                Text(model.title)
                    .bold()
            }
            .padding()
            .frame(width: 250,height: 30, alignment: .leading)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
        .frame(width: 170, height: 230)
        .shadow(radius: 3)
    }
}

struct AlbumCellView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCellView(model: .mock())
    }
}
