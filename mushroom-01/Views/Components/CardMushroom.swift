//
//  CardMushroom.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 13/03/2023.
//

import SwiftUI

struct CardMushroom: View {
    
    @State private var location : String = "Stare Babice"
    @State private var typeMushroom : String = "Muchomor czerwony"
    @State private var forrestType : String = "Las liściasty"
    
    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment: .bottom){
                Image("mushroom")
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("darkGreen"), lineWidth: 10)
                    )
                    .shadow(radius: 5)
                
                VStack(alignment: .leading) {
                    Spacer().frame(height: 10)
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.red)
                        Text((location))
                    }
                    .font(.caption2)
                    .frame(width: geometry.size.width * 0.85, alignment: .leading)
                    .padding(.leading, 40)
                    
                    Spacer().frame(height:5)
                    Text(typeMushroom)
                        .font(.title)
                        .foregroundColor(Color("textGreen"))
                        .frame(width: geometry.size.width * 0.85, alignment: .leading)
                        .padding(.leading, 40)
                    
                    Text(forrestType)
                        .font(.footnote)
                        .foregroundColor(Color("textGreen"))
                        .frame(width: geometry.size.width * 0.85, alignment: .leading)
                        .padding(.leading, 40)
                    
                    Spacer().frame(height: 10)
                }
                .frame(maxWidth: geometry.size.width * 0.85)
                .background(Color.white.opacity(0.85))
                .cornerRadius(10)
                padding(.bottom, 50)
                
            }
            
            .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95)
            
        }
        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.width * 0.95)
        .offset(x: UIScreen.main.bounds.width * 0.5 - UIScreen.main.bounds.width * 0.475)
    }
}

struct CardMushroom_Previews: PreviewProvider {
    static var previews: some View {
        CardMushroom()
    }
}
