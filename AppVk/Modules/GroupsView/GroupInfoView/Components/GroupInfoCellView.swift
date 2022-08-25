//
//  GroupInfoView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 18.08.2022.
//

import SwiftUI

struct GroupInfoCellView: View {
    //@StateObject var viewModel = GroupsListViewModel()
    let model: GroupModel
    
    var body: some View {
        VStack{
            ZStack{
                Image(uiImage: model.photo200.load())
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 10)
                    .frame(width: 400, height: 400)
                VStack{
                    Text(model.name)
                        .padding(.bottom, 10)
                    Text(model.status)
                        .padding(.bottom, 50)
                }
                    .frame(width: 400, height: 400, alignment: .bottom)
                    .font(.largeTitle.bold())
                    .foregroundStyle(
                        .linearGradient(
                            colors: [.black, .black],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    
            }
            Spacer()
            Text(model.description)
                .font(.largeTitle.bold())
                .foregroundStyle(
                    .linearGradient(
                        colors: [.black, .black],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            Spacer()
            
        }
    }
}

struct GroupInfoCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupInfoCellView(model: .mock())
    }
}
