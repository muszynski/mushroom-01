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
        TabView(selection: $selectedTab) {
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }.tag(0)
            
            MapViewMushroom()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }.tag(1)
            
            MushroomList()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }.tag(2)
        }
    }
}

struct MushroomTabView_Previews: PreviewProvider {
    static var previews: some View {
        MushroomTabView()
    }
}


