//
//  Add.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 13/03/2023.
//

import SwiftUI

struct Add: View {
    var body: some View {
        NavigationView{
            VStack{
                AddMushroomView()
            }
            .navigationTitle("Add")
            .navigationBarTitleDisplayMode(.automatic)
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct Add_Previews: PreviewProvider {
    static var previews: some View {
        Add()
    }
}
