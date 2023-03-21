//
//  MapView.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 21/03/2023.
//

import SwiftUI

struct MapViewMushroom: View {
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Map view will be here")
                    .navigationBarTitle("Map", displayMode: .inline)
            }
        }.navigationBarTitle("Mapa")
    }
        
}

struct MapViewMushroom_Previews: PreviewProvider {
    static var previews: some View {
        MapViewMushroom()
    }
}

