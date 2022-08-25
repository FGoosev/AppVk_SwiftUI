//
//  GroupCellView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 12.08.2022.
//

import SwiftUI

struct GroupCellView: View {
    
    let model: GroupModel
    
    var body: some View {
        Button(action: {}){
            HStack{
                Image(uiImage: model.photo50.load())
                    .clipShape(Circle())
                VStack{
                    Text(model.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(model.status)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding(10)
            .frame(height: 60)
        }
    }
}

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupCellView(model: .mock())
    }
}
