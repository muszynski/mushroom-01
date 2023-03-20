//
//  ContentView.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 13/03/2023.
//

import SwiftUI

struct MushroomTabView: View {
    @State private var selectedTab = 0
    var body: some View {
        ZStack{
            TabView {
                Home()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                Add()
                    .tabItem {
                        Image(systemName: "plus.circle.fill")
                        Text("Add")
                    }
                
                MushroomList()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
            }
        }
    }
}
struct MushroomTabView_Previews: PreviewProvider {
    static var previews: some View {
        MushroomTabView()
    }
}
