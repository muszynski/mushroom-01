//
//  List.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 13/03/2023.
//

import SwiftUI

struct List: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("List")
                    .navigationTitle("List")
                    .navigationBarTitleDisplayMode(.automatic)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}
struct List_Previews: PreviewProvider {
    static var previews: some View {
        List()
    }
}
