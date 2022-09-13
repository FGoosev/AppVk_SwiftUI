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
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    @GestureState var isDetectingLongPress = false
    @State var img = "img1"
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                photoCell
            }.blur(radius: isDetectingLongPress ? 5 : 0)
            if isDetectingLongPress {
                ImagePreview(model: model)
                    .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.95)
                    .transition(.scale)
            }
        }
    }
}


extension PhotoCellView{
    
    var photoCell: some View {
        KFImage(URL(string: model.sizes[0].url ?? ""))
            .resizable()
            .cornerRadius(20)
            .frame(width: 150, height: 150)
            .scaledToFit()
            .gesture(LongPressGesture(minimumDuration: 60)
                      .updating($isDetectingLongPress) { currentstate, gestureState,
                               transaction in
                                                                    
                               gestureState = currentstate
                               transaction.animation = Animation.spring()
                       }
                  )
    }
    
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
