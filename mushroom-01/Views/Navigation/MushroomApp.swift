//
//  ContentView.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 13/03/2023.
//

import SwiftUI

struct MushroomApp: View {
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
                
                List()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
            }
        }
    }
}
struct MushroomApp_Previews: PreviewProvider {
    static var previews: some View {
        MushroomApp()
    }
}
