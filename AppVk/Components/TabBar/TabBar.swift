//
//  TabBar.swift
//  AppVk
//
//  Created by Alexandr Gusev on 11.08.2022.
//

import SwiftUI

struct TabBar: View {
    
    @State var current = 2
    
    var body: some View {
        TabView(selection: $current){
            FriendsListView()
                .tag(0)
                .tabItem{
                    Image(systemName: "person.2")
                    Text("Друзья")
                }
            
            GroupsListView()
                .tag(1)
                .tabItem{
                    Image(systemName: "rectangle.3.group")
                    
                    Text("Группы")
                }
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
