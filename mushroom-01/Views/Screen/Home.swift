//
//  Home.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 13/03/2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Home")
            }
        }.navigationTitle("Home coś tam")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
