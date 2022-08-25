//
//  FriendCellView.swift
//  AppVk
//
//  Created by Alexandr Gusev on 11.08.2022.
//

import SwiftUI

struct FriendCellView: View {
    
    let model: FriendModel
        
    var body: some View {
        HStack{
            Image(uiImage: model.photo50.load())
                .clipShape(Circle())
            Text(model.firstName)
            Text(model.lastName)
            Spacer()
            if model.online == 1 {
                Image(systemName: "iphone.homebutton")
            }
            
        }
        .padding(10)
        .frame(height: 60)
    }
}

extension String {
    
    func load() -> UIImage {
        
        do{
            guard let url = URL(string: self) else { return UIImage() }
            
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        }catch {
            
        }
        
        return UIImage()
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView(model: .mock())
    }
}
