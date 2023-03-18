//
//  DetailScreen.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 17/03/2023.
//

import SwiftUI
import CoreLocation

struct MushroomDetailView: View {
    @Binding var imageName: String
    @Binding var location: String
    @Binding var typeMushroom: String
    @Binding var forrestType: String
    @Binding var collectionDate: String
    @Binding var collectionTime: String
    @Binding var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height / 2)
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        Text(typeMushroom)
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                        
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                            
                            Text(location)
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                        }
                    }
                    .padding()
                }
                .frame(height: geometry.size.height / 2)
                
                ZStack(alignment: .top) {
                    Spacer()
                    MapView(coordinate: $coordinate)
                        .frame(height: geometry.size.height / 2)
                    
                    VStack(alignment: .leading) {
                        Spacer().frame(height: 10)
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.red)
                            Text(location)
                        }
                        .font(.caption2)
                        .frame(width: geometry.size.width * 0.85, alignment: .leading)
                        .padding(.leading, 40)
                        
                        Spacer().frame(height: 5)
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
                    .background(Color.white.opacity(0.85))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                }
                .frame(height: geometry.size.height / 2)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct MushroomDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MushroomDetailView(
            imageName: .constant("mushroom"),
            location: .constant("Stare Babice"),
            typeMushroom: .constant("Muchomor czerwony"),
            forrestType: .constant("Las liściasty"),
            collectionDate: .constant("18.03.2023"),
            collectionTime: .constant("12:22"),
            coordinate: .constant(CLLocationCoordinate2D(latitude: 52.2980744, longitude: 20.8984804))
        )
    }
}

