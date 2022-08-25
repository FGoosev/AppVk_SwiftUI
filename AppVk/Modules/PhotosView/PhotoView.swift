//
//  PhotoView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 17.08.2022.
//

import SwiftUI

struct PhotoView: View {
    
    @StateObject var viewModel = PhotoViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(viewModel: PhotoViewModel())
    }
}
