//
//  GroupInfoView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 18.08.2022.
//

import SwiftUI
import Kingfisher

struct GroupInfoCellView: View {
    //@StateObject var viewModel = GroupsListViewModel()
    let model: GroupModel
    
    var body: some View {
        VStack{
            ZStack{
                KFImage(URL(string: model.photo200))
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 7)
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
                            colors: [.white, .white],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    
            }
            Spacer()
            Text(model.description)
                .padding()
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
