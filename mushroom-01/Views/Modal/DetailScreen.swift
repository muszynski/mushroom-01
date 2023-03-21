//
//  DetailScreen.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 17/03/2023.
//

import SwiftUI
import CoreLocation

struct MushroomDetailView: View {
//    @Binding var imageName: String
//    @Binding var location: String
//    @Binding var typeMushroom: String
//    @Binding var forrestType: String
//    @Binding var collectionDate: String
//    @Binding var collectionTime: String
//    @Binding var coordinate: CLLocationCoordinate2D
    
    var mushroomData: MushroomData
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    Image(uiImage: UIImage(data: mushroomData.imageData ?? Data()) ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height / 2)
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        Text(mushroomData.typeMushroom ?? "Unknown Mushroom")
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                        
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                            
                            Text(mushroomData.location ?? "Unknown Location")
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                        }
                    }
                    .padding()
                }
                .frame(height: geometry.size.height / 2)
                
                ZStack(alignment: .top) {
                    Spacer()
                    MapView(coordinate: .constant(CLLocationCoordinate2D(latitude: mushroomData.lat, longitude: mushroomData.long)))
                        .frame(height: geometry.size.height / 2)
                    
                    VStack(alignment: .leading) {
                        Spacer().frame(height: 10)
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.red)
                            Text(mushroomData.location ?? "Unknown Location")
                        }
                        .font(.caption2)
                        .frame(width: geometry.size.width * 0.85, alignment: .leading)
                        .padding(.leading, 40)
                        
                        Spacer().frame(height: 5)
                        Text(mushroomData.typeMushroom ?? "Unknow Type")
                            .font(.title)
                            .foregroundColor(Color("textGreen"))
                            .frame(width: geometry.size.width * 0.85, alignment: .leading)
                            .padding(.leading, 40)
                        
                        Text(mushroomData.forrestType ?? "Unknown Forrest")
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
        MushroomDetailView(mushroomData: MushroomData())
    }
}

