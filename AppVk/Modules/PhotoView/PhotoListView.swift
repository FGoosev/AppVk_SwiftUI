//
//  PhotoListView.swift
//  AppVk
//
//  Created by Александр Гусев on 11.09.2022.
//

import SwiftUI

struct PhotoListView: View {
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

private extension PhotoListView {
    var gridPhoto: some View {
        VStack{
            LazyVGrid(columns: columns, spacing: 20) {
            
            }
            .padding()
        }
    }
}

struct PhotoListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView()
    }
}
