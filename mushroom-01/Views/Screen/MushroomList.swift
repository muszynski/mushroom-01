//
//  List.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 13/03/2023.
//

import SwiftUI

struct MushroomList: View {
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView {
                    VStack(spacing: 3) {
                        ForEach(0..<10) { _ in
                            ListItem()
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
struct MushroomList_Previews: PreviewProvider {
    static var previews: some View {
        MushroomList()
    }
}
