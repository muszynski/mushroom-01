//
//  CardMushroom.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 13/03/2023.
//
import SwiftUI

struct CardMushroom: View {
    var mushroomData: MushroomData
    
    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment: .bottom){
                if let data = mushroomData.imageData, let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("darkGreen"), lineWidth: 10)
                        )
                        .shadow(radius: 3)
                }
                
                VStack(alignment: .leading) {
                    Spacer().frame(height: 10)
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.red)
                        Text("\(mushroomData.location ?? "Unknown Location")")
                    }
                    .font(.caption2)
                    .frame(width: geometry.size.width * 0.85, alignment: .leading)
                    .padding(.leading, 40)
                    
                    Spacer().frame(height:5)
                    Text(mushroomData.typeMushroom ?? "Unknown Mushroom")
                        .font(.title)
                        .foregroundColor(Color("textGreen"))
                        .frame(width: geometry.size.width * 0.85, alignment: .leading)
                        .padding(.leading, 40)
                    
                    Text(formatDate(date: mushroomData.creationDate))
                        .font(.caption2)
                        .font(.footnote)
                        .foregroundColor(Color("textGreen"))
                        .frame(width: geometry.size.width * 0.85, alignment: .leading)
                        .padding(.leading, 40)
                    
                    Spacer().frame(height: 10)
                }
                .frame(maxWidth: geometry.size.width * 0.85)
                .background(Color.white.opacity(0.85))
                .cornerRadius(10)
                .padding(.bottom, 20)
            }
            .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95)
            .padding(.all, geometry.size.width * 0.025)
        }
        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.width * 0.95)
    }
}

struct CardMushroom_Previews: PreviewProvider {
    static var previews: some View {
        CardMushroom(mushroomData: MushroomData())
    }
}
