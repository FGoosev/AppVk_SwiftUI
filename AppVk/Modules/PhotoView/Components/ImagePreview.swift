//
//  ImagePreview.swift
//  AppVk
//
//  Created by Александр Гусев on 11.09.2022.
//

import SwiftUI
import Kingfisher

struct ImagePreview: View {
    let model: PhotoModel
    //@Binding var img : String
    var body: some View {
        ZStack {
            Image(uiImage: model.sizes[0].url?.load() ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(radius: 5)
    }
}

struct ImagePreview_Previews: PreviewProvider {
    static var previews: some View {
        ImagePreview(model: .mock())
    }
}
