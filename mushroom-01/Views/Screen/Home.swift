//
//  Home.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 13/03/2023.
//

import SwiftUI

struct Home: View {
    @State private var isActive: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                CardListHorizontalMushroom()
                Spacer()
                NavigationLink(destination: AddMushroomView(), isActive: $isActive) {
                    Button(action: {
                        isActive = true
                    }) {
                        Text("Dodaj")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 150)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
                .isDetailLink(false)
                Spacer()
            }
            .navigationBarTitle("Home")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
