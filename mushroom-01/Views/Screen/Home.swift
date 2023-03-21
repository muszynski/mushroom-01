//
//  Home.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 13/03/2023.
//

import SwiftUI

struct Home: View {
    @State private var showingAddMushroomView = false

    var body: some View {
        NavigationView {
            VStack {
                CardListHorizontalMushroom()
                Spacer()
                Button(action: {
                    showingAddMushroomView.toggle()
                }) {
                    Text("Dodaj")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 150)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                Spacer()
            }
            .navigationBarTitle("Home")
            .sheet(isPresented: $showingAddMushroomView) {
                AddMushroomView()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


